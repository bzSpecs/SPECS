# %%
import sys
import pandas as pd
import numpy as np
import matplotlib

matplotlib.use('Agg')
import matplotlib.pyplot as plt


def GC_content(string):
    string = string.upper()
    return ((string.count('G') + string.count('C')) / len(string)) * 100

path = sys.argv[1]
path_out = sys.argv[2]
log_file = open(path_out + '/log.txt', 'w+')
# df_barcodes = pd.read_csv('G:/My Drive/S38_PAIRED.csv')
df_barcodes = pd.read_csv(path)
lib_with_names=pd.read_excel('/cs/icore/shirliyadadon/data/lior_nisim/LibraryD7names.xlsx')
lib_with_names.set_index('Kmer', inplace=True)
lib_with_names['name'] = lib_with_names['name'].apply(lambda x: x.split(';')[0])
df_barcodes.dropna(inplace=True)
df_barcodes.drop(columns=['id_'], inplace=True)
grouped_df = df_barcodes.groupby(['promoter', 'barcode']).size().reset_index().rename(columns={0: 'count'})
grouped_df=grouped_df[grouped_df['promoter']!='filler']

log_file.write('total coverage without filtering is %d/5967 = %.2f%%\n' % (
    len(set(grouped_df['promoter'])), (len(set(grouped_df['promoter'])) / 5967) * 100))
tmp=grouped_df.groupby(['barcode']).size()
fig, ax = plt.subplots()
tmp.hist(bins=max(tmp),ax=ax, figure=fig)
ax.set_xlabel('# of promoters a BC points to')
ax.set_ylabel('# of BC that have this many promoters')
ax.set_title('Y barcodes point to X different promoters')
fig.savefig(path_out+'hist_all_bc.pdf')
fig, ax = plt.subplots()
ax.hist(grouped_df['barcode'].apply(GC_content), bins=50)
ax.set_title('histogram of all barcodes GC content')
ax.set_xlabel('GC content (%)')
ax.set_ylabel('number')
fig.savefig(path_out + '/all_BC_GC_hist.pdf')
log_file.write('average GC content for all barcodes is: %.2f %%\n' % np.mean(grouped_df['barcode'].apply(GC_content)))
reps_of_BC = grouped_df[grouped_df.duplicated(subset=['barcode'], keep=False)].sort_values(by=['count', 'barcode'])
tmp=reps_of_BC.groupby(['barcode']).size()
fig, ax = plt.subplots()
tmp.hist(bins=max(tmp),ax=ax, figure=fig)
ax.set_xlabel('# of promoters a BC points to')
ax.set_ylabel('# of BC that have this many promoters')
ax.set_title('Y barcodes point to X different promoters')
fig.savefig(path_out+'hist_rep_bc.pdf')
rep_BC_num_reads = reps_of_BC.groupby(['barcode']).sum().sort_values('count', ascending=False)
rep_BC_num_promoters = reps_of_BC.groupby(['barcode']).count().sort_values('count', ascending=False).drop(
    columns=['count'])
reps = rep_BC_num_promoters.merge(rep_BC_num_reads, on='barcode').rename(columns={'count': 'num_reads'})
reps.to_csv(path_out + '/repeated_BC_promoters_and_reads.csv')
log_file.write(
    'average GC content for repetitive barcodes is: %.2f %%\n' % np.mean(reps.reset_index()['barcode'].apply(GC_content)))
fig, ax = plt.subplots()
ax.hist(reps.reset_index()['barcode'].apply(GC_content), bins=50)
ax.set_title('histogram of repetitive barcodes GC content')
ax.set_xlabel('GC content (%)')
ax.set_ylabel('number')
fig.savefig(path_out + '/repeated_BC_GC_hist.pdf')

fig, ax = plt.subplots()
barcode_group = grouped_df.groupby(['barcode']).count()
barcode_group.hist('promoter', bins=100, ax=ax)
ax.set_title('promoters per barcode histogram')
ax.set_xlabel('# of promoters per barcode')
ax.set_ylabel('# of barcodes with this many promoters')
fig.savefig(path_out + '/promoters_per_barcode_hist.pdf')

no_repeats = grouped_df[~grouped_df.duplicated(subset=['barcode'], keep=False)]
new = no_repeats['promoter'].str.split(';', expand = True)
no_repeats['ID']=new[0]
no_repeats['promoter']=new[1]
no_repeats['TF']=no_repeats['promoter'].apply(lambda x: lib_with_names.loc[x,'name'])
no_repeats['clean_TF']=no_repeats['promoter'].apply(lambda x: lib_with_names.loc[x,'clean_name'])
allow_3=grouped_df[grouped_df.duplicated(subset=['barcode'], keep=False).groupby(grouped_df['barcode']).transform('sum').le(3)]
allow_3.sort_values(by=['barcode'], inplace=True)
print(allow_3)
new = allow_3['promoter'].str.split(';', expand = True)
allow_3['ID']=new[0]
allow_3['promoter']=new[1]
allow_3['TF']=allow_3['promoter'].apply(lambda x: lib_with_names.loc[x,'name'])
no_repeats['clean_TF']=no_repeats['promoter'].apply(lambda x: lib_with_names.loc[x,'clean_name'])
fig, ax = plt.subplots()
ax.hist(no_repeats['barcode'].apply(GC_content), bins=50)
ax.set_title('histogram of unique barcodes GC content')
ax.set_xlabel('GC content (%)')
ax.set_ylabel('number')
fig.savefig(path_out + '/unique_BC_GC_hist.pdf')
log_file.write('average GC content for unique barcodes is: %.2f %%\n' % np.mean(no_repeats['barcode'].apply(GC_content)))
log_file.write('there are %d repeated barcodes\n' % len(reps))

fig, ax = plt.subplots()
promoter_count = grouped_df.groupby(['promoter']).count()
promoter_count.hist('barcode', bins=round(max(promoter_count.barcode) / 50), ax=ax)
ax.set_title('barcodes per promoter histogram')
ax.set_xlabel('# of barcodes per promoter')
ax.set_ylabel('# of promoters with this many barcodes')
fig.savefig(path_out + '/barcodes_per_promoter_no_filt_hist.pdf')

no_repeats.sort_values(by=['promoter'], inplace=True)
num_BC_to_prom = no_repeats.groupby(['promoter']).count().drop(columns=['count']).rename(
    columns={'barcode': 'unique_BCs'})
num_reads_to_prom = no_repeats.groupby(['promoter']).sum().rename(columns={'count': 'num_reads'})
promoters_data = num_BC_to_prom.merge(num_reads_to_prom, on='promoter').sort_values(by=['unique_BCs'], ascending=False)
promoters_data.drop(columns=['ID','TF'], inplace=True)
# print(promoters_data)
promoters_data.to_csv(path_out + '/promoters_counts.csv')
no_repeats.to_csv(path_out + '/library_with_counts.csv')

lib = pd.read_csv('/cs/icore/shirliyadadon/data/lior_nisim/lib_D7.fasta')
promoter_ids = lib.iloc[range(1, 11932, 2), :]['>filler'].apply(lambda x: x[1:]).rename('ID')
promoter_ids = promoter_ids.reset_index().drop(columns=['index'])
promoter_ids['ID']=promoter_ids['ID'].apply(lambda x: x.split(';')[1])
found_Kmer = promoter_ids[promoter_ids['ID'].isin(promoters_data.index)]
# found_Kmer['ID'] = found_Kmer.ID.apply(lambda x: x.split(';')[1])
not_found_Kmer = promoter_ids[~promoter_ids['ID'].isin(promoters_data.index)]
# not_found_Kmer['ID'] = not_found_Kmer.ID.apply(lambda x: x.split(';')[1])

fig, ax = plt.subplots(nrows=2, ncols=2)
ax[0, 0].hist(not_found_Kmer['ID'].apply(GC_content), bins=100)
ax[0, 0].set_title('not found kmers GC content')
ax[0, 0].set_xlabel('GC content (%)')
ax[0, 0].set_ylabel('number')

ax[0, 1].hist(found_Kmer['ID'].apply(GC_content), bins=100)
ax[0, 1].set_title('found kmers GC content')
ax[0, 1].set_xlabel('GC content (%)')
ax[0, 1].set_ylabel('number')

ax[1, 0].hist(not_found_Kmer['ID'].apply(len), bins=30)
ax[1, 0].set_title('not found kmers lengths')
ax[1, 0].set_xlabel('length (bp)')
ax[1, 0].set_ylabel('number')

ax[1, 1].hist(found_Kmer['ID'].apply(len), bins=30)
ax[1, 1].set_title('found kmers lengths')
ax[1, 1].set_xlabel('length (bp)')
ax[1, 1].set_ylabel('number')
fig.tight_layout()
fig.savefig(path_out + '/Kmers_histograms.pdf')
log_file.write('average GC content for not found Kmers is: %.2f %%\n' % np.mean(not_found_Kmer['ID'].apply(GC_content)))
log_file.write('average GC content for found Kmers is: %.2f %%\n' % np.mean(found_Kmer['ID'].apply(GC_content)))
log_file.write('average length for not found Kmers is: %.2f\n' % np.mean(not_found_Kmer['ID'].apply(len)))
log_file.write('average length for found Kmers is: %.2f\n\n' % np.mean(found_Kmer['ID'].apply(len)))
lenReps=reps.shape[0]
lenUnq = no_repeats.shape[0]
log_file.write('there are %d reads of non-unique barcodes (from %d non-unique BCs) and %d reads of unique barcodes ('
               'from %d unique combinations of Kmer-BC)\n'
               %(sum(reps['num_reads']), lenReps, sum(no_repeats['count']), lenUnq))
log_file.write('coverage when using unique barcodes is %d/5967 = %.2f%%\n' % (
    len(set(no_repeats['promoter'])), (len(set(no_repeats['promoter'])) / 5967) * 100))

log_file.write('coverage when allowing 3 promoters per BC is %d/5967 = %.2f%%\n' % (
    len(set(allow_3['promoter'])), (len(set(allow_3['promoter'])) / 5967) * 100))
allow_3.to_csv(path_out+'/lib_thresh_3.csv')
log_file.close()
