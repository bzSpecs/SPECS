import json
import sys
import ipdb
import os
import subprocess

config_file = sys.argv[1]

pyscripts_folder = '../pyscripts'
sum_unique_17_counts_py = f'{pyscripts_folder}/sum_unique_17_counts_results.py'
normalize_by_factor_py = f'{pyscripts_folder}/normalize_sum_by_factor.py'
filter_greater_py = f'{pyscripts_folder}/filter_results_greater_than.py'
find_uniqueness_py = f'{pyscripts_folder}/find_uniqueness_in_cell_line.py'
rename_columns_py = f'{pyscripts_folder}/rename_columns.py'
join_specific_columns_py = f'{pyscripts_folder}/join_specific_columns.py'

config_file = open(config_file)
config = json.load(config_file)

output_folder = config['output_folder']
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

groups = config['groups']
group_names = [group['name'] for group in groups]

output_files = {}
for group in groups:
    group_name = group['name']
    filter_greater = group['filter_greater']
    unique_fold = group['unique_fold']
    biological_replicates = group['biological_replicates']

    # --------- setting the file names for each of the analysis ---------
    # setting the file names for the combined biological replicates
    output_files[group_name] = {}
    output_files[group_name]['output_sum_unique_17'] = f'{output_folder}/{group_name}/sum_{group_name}.csv'
    # output_files[group_name]['output_sum_unique_17_with_reverse'] = f'{output_folder}/{group_name}/sum_{group_name}_with_reverse_data.csv'
    output_files[group_name]['output_normalized_sum_unique_17'] = f'{output_folder}/{group_name}/normalized_sum_{group_name}.csv'
    # output_files[group_name]['output_normalized_sum_unique_17_with_reverse'] = f'{output_folder}/{group_name}/normalized_sum_{group_name}_with_reverse_data.csv'
    output_files[group_name]['output_normalized_filtered_greater'] = f'{output_folder}/{group_name}/normalized_sum_{group_name}_above_{filter_greater}.csv'
    output_files[group_name]['output_unique_fold'] = f'{output_folder}/{group_name}/unique_{group_name}_{unique_fold}_fold.csv'

    # setting the file names for a biological replicate
    for bio_rep in biological_replicates:
        bio_name = bio_rep['name']

        output_files[group_name][bio_name] = {}
        output_files[group_name][bio_name][
            'output_bio_sum_unique_17'] = f'{output_folder}/{group_name}/{bio_name}/sum_{group_name}_{bio_name}.csv'
        output_files[group_name][bio_name][
            'output_bio_normalized_sum_unique_17'] = f'{output_folder}/{group_name}/{bio_name}/normalized_sum_{group_name}_{bio_name}.csv'

# starting the first analyse pipeline - summarizing and filtering
for group in groups:
    group_name = group['name']
    biological_replicates = group['biological_replicates']
    # all tech "not-normalized" file paths for a specific experiment group
    all_tech_reps_files = []
    # tech normalized file paths for a specific experiment group
    all_norm_tech_reps_files = []
    # sum the total number of reads in the raw barcodes files
    group_number_of_total_reads = 0

    for bio_rep in biological_replicates:
        bio_name = bio_rep['name']
        technical_replicates = bio_rep['technical_replicates']

        # gathering all the techs unique_17-count file paths for a bio replicate
        bio_files = [tech_rep['unique_17_count_file']
                     for tech_rep in technical_replicates]
        bio_files_joined = ','.join(bio_files)
        all_tech_reps_files.extend(bio_files)

        # perform summarizing unique_17-count in the biological replicate level
        subprocess.call(['python', sum_unique_17_counts_py, bio_files_joined,
                         output_files[group_name][bio_name]['output_bio_sum_unique_17']])

        # gathering all the techs normalized unique_17-count file paths for a bio replicate
        norm_bio_files = [tech_rep['normalized_unique_17_count_file']
                          for tech_rep in technical_replicates]
        norm_bio_files_joined = ','.join(norm_bio_files)
        all_norm_tech_reps_files.extend(norm_bio_files)

        # perform summarizing normalized unique_17-count in the biological replicate level
        subprocess.call(['python', sum_unique_17_counts_py, norm_bio_files_joined,
                         output_files[group_name][bio_name]['output_bio_normalized_sum_unique_17']])

        bio_cleaned_raw_paired_files = [tech_rep['cleaned_raw_paired_file']
                                        for tech_rep in technical_replicates]
        for f in bio_cleaned_raw_paired_files:
            file = open(f, "r")
            line_count = 0
            for line in file:
                if line != "\n":
                    line_count += 1
            # decrement by one because of the csv title
            group_number_of_total_reads += line_count-1
            file.close()

    # perform summarizing unique_17-count in the group replicate level
    all_tech_reps_files_joined = ','.join(all_tech_reps_files)
    subprocess.call(['python', sum_unique_17_counts_py, all_tech_reps_files_joined,
                     output_files[group_name]['output_sum_unique_17']])

    # perform summarizing normalized unique_17-count in the group replicate level
    all_norm_tech_reps_files_joined = ','.join(all_norm_tech_reps_files)
    subprocess.call(['python', sum_unique_17_counts_py,
                     all_norm_tech_reps_files_joined, output_files[group_name]['output_normalized_sum_unique_17']])
    # normalize the summarized normalized unique_17-count file based on the total reads number
    subprocess.call(['python', normalize_by_factor_py, output_files[group_name]['output_normalized_sum_unique_17'],
                     str(group_number_of_total_reads), "1000000", output_files[group_name]['output_normalized_sum_unique_17']])

    # filter the results that their count value are greater than the `filter_greater` input value
    filter_greater = str(group['filter_greater'])
    subprocess.call(['python', filter_greater_py, output_files[group_name]['output_normalized_sum_unique_17'],
                     filter_greater, output_files[group_name]['output_normalized_filtered_greater']])

# starting the first analyse pipeline - find uniqueness
for group in groups:
    group_name = group['name']
    compared_groups = [g for g in groups if g['name'] != group_name]

    unique_fold = str(group['unique_fold'])

    filter_greater = str(group['filter_greater'])

    # gathering the normalized-filtered file path to compare with the current group file
    compared_files = [output_files[compared_group['name']]
                      ['output_normalized_filtered_greater'] for compared_group in compared_groups]
    # gathering the group names to compare with the current group
    compared_groups_names = [compared_group["name"]
                             for compared_group in compared_groups]

    compared_files_joined = ','.join(compared_files)
    compared_groups_names_joined = ','.join(compared_groups_names)
    unique_promoters_output_file = output_files[group_name]['output_unique_fold']

    # extract the unique promoters in the current group based on a `fold` value input
    subprocess.call(['python', find_uniqueness_py, output_files[group_name]['output_normalized_filtered_greater'], compared_files_joined,
                     compared_groups_names_joined, unique_fold, unique_promoters_output_file])

    # generating a new column names for the count and the normalized-filtered count of the compared groups
    compared_groups_count_columns_names = [
        f'count_{c}' for c in compared_groups_names]
    compared_groups_count_columns_new_names = [
        f'count_normalized_and_filtered_{c}' for c in compared_groups_names]

    compared_groups_count_columns_names_joined = ','.join(
        compared_groups_count_columns_names)
    compared_groups_count_columns_new_names_joined = ','.join(
        compared_groups_count_columns_new_names)

    # rename the default columns names for the compared groups by the new generated ones
    subprocess.call(['python', rename_columns_py, output_files[group_name]['output_unique_fold'], compared_groups_count_columns_names_joined,
                     compared_groups_count_columns_new_names_joined, output_files[group_name]['output_unique_fold']])

    # rename the group count column to be count_normalized_and_filtered_{group_name}
    subprocess.call(['python', rename_columns_py, output_files[group_name]['output_unique_fold'], 'count',
                     f'count_normalized_and_filtered_{group_name}', output_files[group_name]['output_unique_fold']])
