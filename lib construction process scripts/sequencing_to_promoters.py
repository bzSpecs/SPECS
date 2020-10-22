#############
# read fastq file of one-end RNA-seq experiment and match read barcode to its promoter

import os, re, sys, time
import pandas as pd
import numpy as np
import string
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt

tab = str.maketrans("ACTG", "TGAC")


def count_appearent(set1, set2):
    counter = 0
    for i in set1:
        if i in set2:
            counter += 1
    return counter


path_lib_unique = sys.argv[1]
lib = pd.read_csv(path_lib_unique, index_col=0)
path_lib_repeat = sys.argv[2]
lib_rep = pd.read_csv(path_lib_repeat, index_col=0)
path_data = sys.argv[3]
path_out = path_data.split('cut_adapt_out')[0] + 'combined_analysis/'
os.popen('mkdir -p ' + path_out)
time.sleep(2)
log_file = open(path_out + 'log.txt', 'w+')
rep_BCs = pd.read_csv(
    '/cs/icore/shirliyadadon/data/lior_nisim/library_preparation/final/lib_CHAJA1_S38/repeated_BC_promoters_and_reads.csv')
# lib_names = pd.read_excel('/cs/icore/shirliyadadon/data/lior_nisim/LibraryD7names.xlsx')

data = pd.read_csv(path_data, header=None, names=['barcode'])  # data is in fastq format
data = data.loc[range(1, data.shape[0], 4), :].reset_index(
    drop=True)  # extract 2nd line(sequence) out of 4-line-read-format
data['barcode'] = data['barcode'].apply(lambda x: x[:20])  # remove the constant GC at the end.
# tmp=data.head(20)
# log_file.write(tmp.head())
data['barcode'] = data['barcode'].apply(lambda x: x.translate(tab)[::-1])  # reverse compliment
data = data.groupby(by=['barcode']).size().reset_index().rename(columns={0: 'count_reads'}).sort_values(
    by=['count_reads'], ascending=False)
log_file.write('total of %d BCs are found in the experiment\n' % data.shape[0])
log_file.write('these are the top 10 barcodes expressed:\n')
log_file.write(',\t'.join(str(s) for s in data.columns) + '\n')
for i, row in data.head(10).iterrows():
    stri = ',\t'.join(str(s) for s in row)
    log_file.write(stri)
    log_file.write('\n')

# log_file.write('total number of reads before filtering: %d\n' % sum(data['count_reads']))
lBC = set(lib['barcode'])
rBC = set(rep_BCs['barcode'])
data_in_rep = data[data['barcode'].isin(rBC)]
log_file.write('%d barcodes found in repeated BCs\n' % data_in_rep.shape[0])
data_rep = data[data['barcode'].isin(set(lib_rep['barcode']))]
fig, ax = plt.subplots()
data_rep.boxplot('count_reads', ax=ax)
fig.savefig(path_out+'boxplot_rep_BCs.pdf')
filt_lib_rep = lib_rep[lib_rep['barcode'].isin(data_rep['barcode'])].merge(data_rep, on='barcode').rename(
    columns={'count': 'lib_ref_count'})
# print(filt_lib_rep.loc[51672:51673])
log_file.write('coverage of promoters with barcodes with 3 promoters: %d/5967 = %.2f%%\n' % (
    len(set(filt_lib_rep['promoter'])), (len(set(filt_lib_rep['promoter'])) / 5967) * 100))
data_unique = data[data['barcode'].isin(lBC)]
fig, ax = plt.subplots()
data_unique.boxplot('count_reads', ax=ax)
fig.savefig(path_out+'boxplot_unique_BCs.pdf')
filtLib = lib[lib['barcode'].isin(data_unique['barcode'])].merge(data_unique, on='barcode').rename(
    columns={'count': 'lib_ref_count'}).sort_values(by=['count_reads'], ascending=False)
print(filtLib)
log_file.write('coverage of promoters with unique barcodes: %d/5967 = %.2f%%\n' % (
    len(set(filtLib['promoter'])), (len(set(filtLib['promoter'])) / 5967) * 100))
time_start=time.time()
# for bc in set(filt_lib_rep['barcode']):
#     if bc in rBC:
#         diff = 100000
#         toSave = ''
#         for i, inner_row in filt_lib_rep[filt_lib_rep['barcode'] == bc].iterrows():
#             # print(data.loc[data['barcode'] == bc, 'count_reads'])
#             # print(filtLib.loc[filtLib['promoter'] == inner_row['promoter'],'count_reads'])
#             # print(abs(data.loc[data['barcode'] == bc, 'count_reads']-np.mean(filtLib.loc[filtLib['promoter'] == inner_row['promoter'],'count_reads'])).iloc[0])
#             d = abs(inner_row['count_reads'] - np.mean(
#                 filtLib.loc[filtLib['promoter'] == inner_row['promoter'],'count_reads']))
#             # if inner_row['promoter'] not in filtLib['promoter']:
#             #     d=0
#             # print(inner_row,d,diff)
#             if (d < diff and not np.isnan(d)):
#                 diff=d
#                 toSave = inner_row
#         if type(toSave)!=str:
#             filtLib=filtLib.append(toSave)
fig, ax = plt.subplots()
filtLib.boxplot('count_reads', ax=ax)
fig.savefig(path_out+'boxplot_refined_BCs.pdf')
print(filtLib)
log_file.write('coverage of promoters refined with unique barcodes: %d/5967 = %.2f%%\n' % (
    len(set(filtLib['promoter'])), (len(set(filtLib['promoter'])) / 5967) * 100))
print('refining all BCs %d minutes' %((time.time()-time_start)/60))
log_file.write('%d unique BCs (point at one promoter) found in the experiment\n' % data_unique.shape[0])
log_file.write('these are the top 10 unique BCs expressed:\n')
log_file.write(',\t'.join(str(s) for s in filtLib.columns) + '\n')
for i, row in filtLib.head(10).iterrows():
    stri = ',\t'.join(str(s) for s in row)
    log_file.write(stri)
    log_file.write('\n')
# normalization of rna capture of barcodes
filtLib['norm_count_reads'] = (filtLib['count_reads'] / filtLib['lib_ref_count'])*np.mean(filtLib['lib_ref_count'])
# --------- filter out BCs that are outliers to the promoter's BCs ---------
for idx, row in filtLib.iterrows():
    if row['norm_count_reads']>filtLib[filtLib['promoter']==row['promoter']].quantile(.90)['norm_count_reads'] or \
            row['norm_count_reads'] < filtLib[filtLib['promoter'] == row['promoter']].quantile(.5)['norm_count_reads'] :
        filtLib.drop(idx, inplace=True)
# count raw reads, draw hist bc to promotor, hist read to bc, at the end plot normalized count hist
# histograms of reads:
fig, ax = plt.subplots(nrows=1, ncols=3, figsize=(14, 6))
filtLib.hist('count_reads', bins=100, ax=ax[0])
ax[0].set_title('RNA-seq experiment')
ax[0].set_xlabel('# reads per BC')
ax[0].set_ylabel('# of BCs with this much reads')
filtLib.hist('norm_count_reads', bins=100, ax=ax[1])
ax[1].set_title('normalized RNA-seq')
ax[1].set_xlabel('# reads per BC')
ax[1].set_ylabel('# of BCs with this much reads')
filtLib.hist('lib_ref_count', bins=max(filtLib['lib_ref_count']), ax=ax[2])
ax[2].set_title('Library counts')
ax[2].set_xlabel('# reads per BC')
ax[2].set_ylabel('# of BCs with this much reads')
fig.tight_layout()
fig.savefig(path_out + 'reads_per_barcode.pdf')
# histograms of BC per promoter
tmp1 = filtLib.groupby(by=['promoter']).size().rename('count_BCs')
fig, ax = plt.subplots()
tmp1.hist(bins=50, ax=ax, figure=fig)
ax.set_xlabel('# of BCs per promoter')
ax.set_ylabel('# of promoters with this many BCs')
ax.set_title('Barcodes per promoter histogram')
fig.tight_layout()
fig.savefig(path_out + 'hist_bc_per_promoter.pdf')
# histogram of normalized count
# at the end plot counts per promoter
tmp = filtLib.groupby(by=['promoter']).sum().sort_values(by=['count_reads'], ascending=False)
toSave = filtLib[filtLib['promoter'].isin(tmp.iloc[0:10].index)][['promoter', 'ID', 'TF', 'barcode', 'count_reads']]
for i, row in toSave.iterrows():
    toSave.loc[i, 'total_to_promoter'] = tmp.loc[row['promoter'], 'count_reads']
toSave.sort_values(by=['total_to_promoter', 'promoter'], ascending=False, inplace=True)
toSave.to_csv(path_out + 'top_10_promoters.csv')

toSave = filtLib[filtLib['promoter'].isin(tmp.iloc[-5:].index)][['promoter', 'ID', 'TF', 'barcode', 'count_reads']]
for i, row in toSave.iterrows():
    toSave.loc[i, 'total_to_promoter'] = tmp.loc[row['promoter'], 'count_reads']
toSave.sort_values(by=['total_to_promoter', 'promoter'], ascending=False, inplace=True)
toSave.to_csv(path_out + 'lowest_5_promoters.csv')

toSave = filtLib[filtLib['promoter'].isin(tmp[tmp['count_reads'] > tmp['count_reads'].median()].iloc[-5:, :].index)][
    ['promoter', 'ID', 'TF', 'barcode', 'count_reads']]
for i, row in toSave.iterrows():
    toSave.loc[i, 'total_to_promoter'] = tmp.loc[row['promoter'], 'count_reads']
toSave.sort_values(by=['total_to_promoter', 'promoter'], ascending=False, inplace=True)
toSave.to_csv(path_out + 'mid_5_promoters.csv')

tmp['read_to_num_BC_ratio'] = tmp.apply(lambda x: x['count_reads'] / tmp1[x.name], axis='columns')
zoomin = tmp.iloc[0:200, :]
ax = tmp.plot.bar(y=['count_reads', 'norm_count_reads'], subplots=True, figsize=(20, 6))
plt.tight_layout()
plt.savefig(path_out + 'reads_per_promoter.pdf')
ax = zoomin.plot.bar(y=['count_reads', 'norm_count_reads'], title='reads per promotors 0-200', subplots=True,
                     figsize=(20, 6))
plt.tight_layout()
plt.savefig(path_out + 'zoomin_reads_per_promoter.pdf')
# tmp.sort_values(by=['norm_count_reads'], inplace=True)
# ax = tmp.plot.bar(y='norm_count_reads')
# plt.savefig(path_out + 'norm_reads_per_promoter.pdf')
tmp = filtLib.groupby(by=['TF']).sum().sort_values(by=['count_reads'], ascending=False)
tmpNorm = filtLib.groupby(by=['TF']).sum().sort_values(by=['norm_count_reads'], ascending=False)
toSave = filtLib[filtLib['TF'].isin(tmp.iloc[0:10].index)][['TF', 'promoter', 'ID', 'barcode', 'count_reads']]
for i, row in toSave.iterrows():
    toSave.loc[i, 'total_to_TF'] = tmp.loc[row['TF'], 'count_reads']
toSave.sort_values(by=['total_to_TF', 'TF'], ascending=False, inplace=True)
toSave.to_csv(path_out + 'top_10_TFs.csv')

toSave = filtLib[filtLib['TF'].isin(tmp.iloc[-5:].index)][['TF', 'promoter', 'ID', 'barcode', 'count_reads']]
for i, row in toSave.iterrows():
    toSave.loc[i, 'total_to_TF'] = tmp.loc[row['TF'], 'count_reads']
toSave.sort_values(by=['total_to_TF', 'TF'], ascending=False, inplace=True)
toSave.to_csv(path_out + 'lowest_5_TFs.csv')

toSave = filtLib[filtLib['TF'].isin(tmp[tmp['count_reads'] > tmp['count_reads'].median()].iloc[-5:, :].index)] \
    [['TF', 'promoter', 'ID', 'barcode', 'count_reads']]
for i, row in toSave.iterrows():
    toSave.loc[i, 'total_to_TF'] = tmp.loc[row['TF'], 'count_reads']
toSave.sort_values(by=['total_to_TF', 'TF'], ascending=False, inplace=True)
toSave.to_csv(path_out + 'mid_5_TFs.csv')

zoomin = tmp.iloc[0:150, :]
ax = tmp.plot.bar(y=['count_reads'], figsize=(20, 6))
fig = ax.get_figure()
fig.tight_layout()
fig.savefig(path_out + 'reads_per_TF.pdf')
ax = zoomin.plot.bar(y=['count_reads'], title='reads per transcription factor 1-150', figsize=(20, 6))
fig = ax.get_figure()
fig.tight_layout()
fig.savefig(path_out + 'zoomin_reads_per_TF.pdf')
ax = tmpNorm.iloc[:150].plot.bar(y=['norm_count_reads'], title='reads per transcription factor 1-150', figsize=(20, 6))
fig = ax.get_figure()
fig.tight_layout()
fig.savefig(path_out + 'zoomin_norm_reads_per_TF.pdf')
with open(path_out + 'top_100_TFs.txt', 'w+') as f:
    for i, row in zoomin.iloc[0:100, :].iterrows():
        f.write("{:<20}{:>10}\n".format(row.name, row['count_reads']))
with open(path_out + 'top_100_TFs_normilized.txt', 'w+') as f:
    for i, row in tmpNorm.iloc[0:100, :].iterrows():
        f.write("{:<20}{:>10}\n".format(row.name, row['norm_count_reads']))
with open(path_out + 'top_100to200_TFs.txt', 'w+') as f:
    for i, row in tmp.iloc[100:200, :].iterrows():
        f.write("{:<20}{:>10}\n".format(row.name, row['count_reads']))
with open(path_out + 'top_100to200_TFs_normilized.txt', 'w+') as f:
    for i, row in tmpNorm.iloc[100:200, :].iterrows():
        f.write("{:<20}{:>10}\n".format(row.name, row['norm_count_reads']))
with open(path_out + 'top_200to300_TFs.txt', 'w+') as f:
    for i, row in tmp.iloc[200:300, :].iterrows():
        f.write("{:<20}{:>10}\n".format(row.name, row['count_reads']))
with open(path_out + 'top_200to300_TFs_normilized.txt', 'w+') as f:
    for i, row in tmpNorm.iloc[200:300, :].iterrows():
        f.write("{:<20}{:>10}\n".format(row.name, row['norm_count_reads']))
log_file.close()
filtLib.to_csv(path_out+'all_matches_libToRNA.csv')
