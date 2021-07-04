import json
import sys
import ipdb
import os
import subprocess

config_file = sys.argv[1]

pyscripts_folder = "../pyscripts"
sum_promoters_counts_py = f"{pyscripts_folder}/sum_promoters_counts_results.py"
normalize_by_factor_py = f"{pyscripts_folder}/normalize_sum_by_factor.py"
calculate_ratio_between_columns_py = (
    f"{pyscripts_folder}/calculate_ratio_between_columns.py"
)
rename_columns_py = f"{pyscripts_folder}/rename_columns.py"
add_number_of_barcodes_py = f"{pyscripts_folder}/add_number_of_barcodes.py"
add_reversed_compliment_promoter_column_py = (
    f"{pyscripts_folder}/add_reversed_compliment_promoter_column.py"
)
join_specific_columns_py = f"{pyscripts_folder}/join_specific_columns.py"

config_file = open(config_file)
config = json.load(config_file)

output_folder = config["output_folder"]
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

groups = config["groups"]
group_names = [group["name"] for group in groups]

D7_library_data = config["library_data_file_path"]

output_files = {}
for group in groups:
    group_name = group["name"]
    biological_replicates = group["biological_replicates"]

    # --------- setting the file names for each of the analysis ---------
    # setting the file names for the combined biological replicates
    output_files[group_name] = {}
    output_files[group_name][
        "output_sum_promoter"
    ] = f"{output_folder}/{group_name}/sum_{group_name}.csv"
    output_files[group_name][
        "output_sum_promoter_with_reverse"
    ] = f"{output_folder}/{group_name}/sum_{group_name}_with_reverse_data.csv"
    output_files[group_name][
        "output_normalized_sum_promoter"
    ] = f"{output_folder}/{group_name}/normalized_sum_{group_name}.csv"
    output_files[group_name][
        "output_normalized_sum_promoter_with_reverse"
    ] = f"{output_folder}/{group_name}/normalized_sum_{group_name}_with_reverse_data.csv"
    output_files[group_name][
        "output_group_summarized_info"
    ] = f"{output_folder}/{group_name}/summarized_info_{group_name}.csv"
    output_files[group_name][
        "output_final"
    ] = f"{output_folder}/{group_name}/final_{group_name}.csv"
    output_files[group_name][
        "output_final_with_lib_data"
    ] = f"{output_folder}/{group_name}/final_{group_name}_with_lib_data.csv"

    # setting the file names for a biological replicate
    for bio_rep in biological_replicates:
        bio_name = bio_rep["name"]

        output_files[group_name][bio_name] = {}
        output_files[group_name][bio_name][
            "output_bio_sum_promoter"
        ] = f"{output_folder}/{group_name}/{bio_name}/sum_{group_name}_{bio_name}.csv"
        output_files[group_name][bio_name][
            "output_bio_normalized_sum_promoter"
        ] = f"{output_folder}/{group_name}/{bio_name}/normalized_sum_{group_name}_{bio_name}.csv"

# starting the first analyse pipeline - summarizing and filtering
for group in groups:
    group_name = group["name"]
    biological_replicates = group["biological_replicates"]
    # all tech "not-normalized" file paths for a specific experiment group
    all_tech_reps_files = []
    # tech normalized file paths for a specific experiment group
    all_norm_tech_reps_files = []
    # sum the total number of reads in the raw barcodes files
    group_number_of_total_reads = 0

    for bio_rep in biological_replicates:
        bio_name = bio_rep["name"]
        technical_replicates = bio_rep["technical_replicates"]

        # gathering all the techs promoter-count file paths for a bio replicate
        bio_files = [
            tech_rep["promoter_count_file"] for tech_rep in technical_replicates
        ]
        bio_files_joined = ",".join(bio_files)
        all_tech_reps_files.extend(bio_files)

        # perform summarizing promoter-count in the biological replicate level
        subprocess.call(
            [
                "python",
                sum_promoters_counts_py,
                bio_files_joined,
                output_files[group_name][bio_name]["output_bio_sum_promoter"],
            ]
        )

        # gathering all the techs normalized promoter-count file paths for a bio replicate
        norm_bio_files = [
            tech_rep["normalized_promoter_count_file"]
            for tech_rep in technical_replicates
        ]
        norm_bio_files_joined = ",".join(norm_bio_files)
        all_norm_tech_reps_files.extend(norm_bio_files)

        # perform summarizing normalized promoter-count in the biological replicate level
        subprocess.call(
            [
                "python",
                sum_promoters_counts_py,
                norm_bio_files_joined,
                output_files[group_name][bio_name][
                    "output_bio_normalized_sum_promoter"
                ],
            ]
        )

        # gathering all the techs averagegs normalized promoter-count file paths for a bio replicate

        bio_raw_barcodes_files = [
            tech_rep["raw_barcodes_file"] for tech_rep in technical_replicates
        ]
        for f in bio_raw_barcodes_files:
            file = open(f, "r")
            line_count = 0
            for line in file:
                if line != "\n":
                    line_count += 1
            # decrement by one because of the csv title (`barcode`)
            group_number_of_total_reads += line_count - 1
            file.close()

    # perform summarizing promoter-count in the group replicate level
    all_tech_reps_files_joined = ",".join(all_tech_reps_files)
    subprocess.call(
        [
            "python",
            sum_promoters_counts_py,
            all_tech_reps_files_joined,
            output_files[group_name]["output_sum_promoter"],
        ]
    )

    # perform summarizing normalized promoter-count in the group replicate level
    all_norm_tech_reps_files_joined = ",".join(all_norm_tech_reps_files)
    subprocess.call(
        [
            "python",
            sum_promoters_counts_py,
            all_norm_tech_reps_files_joined,
            output_files[group_name]["output_normalized_sum_promoter"],
        ]
    )
    # normalize the summarized normalized promoter-count file based on the total reads number
    subprocess.call(
        [
            "python",
            normalize_by_factor_py,
            output_files[group_name]["output_normalized_sum_promoter"],
            str(group_number_of_total_reads),
            "1000000",
            output_files[group_name]["output_normalized_sum_promoter"],
        ]
    )

    # add the number of barcodes per promoter in lib
    subprocess.call(
        [
            "python",
            add_number_of_barcodes_py,
            output_files[group_name]["output_normalized_sum_promoter"],
            D7_library_data,
            output_files[group_name]["output_group_summarized_info"],
        ]
    )

    subprocess.call(
        [
            "python",
            calculate_ratio_between_columns_py,
            output_files[group_name]["output_group_summarized_info"],
            "count",
            "number_of_barcodes",
            "avg_count_based_on_number_of_barcodes",
            "",
            "",
            "1000",
            output_files[group_name]["output_group_summarized_info"],
        ]
    )

    # add reversed promoter column
    subprocess.call(
        [
            "python",
            add_reversed_compliment_promoter_column_py,
            output_files[group_name]["output_group_summarized_info"],
            output_files[group_name]["output_group_summarized_info"],
            output_files[group_name]["output_group_summarized_info"],
        ]
    )

    # join the reversed promoter count and avg count for calculate ratio later
    subprocess.call(
        [
            "python",
            join_specific_columns_py,
            output_files[group_name]["output_group_summarized_info"],
            output_files[group_name]["output_group_summarized_info"],
            "promoter",
            "promoter_reverse",
            "count,avg_count_based_on_number_of_barcodes",
            "",
            "reverse_compliment_count,reverse_compliment_avg_count_based_on_number_of_barcodes",
            "left",
            "",
            "",
            "avg_count_based_on_number_of_barcodes",
            "False",
            output_files[group_name]["output_group_summarized_info"],
        ]
    )

    # calculate forward-reverse ratio of normalized count
    subprocess.call(
        [
            "python",
            calculate_ratio_between_columns_py,
            output_files[group_name]["output_group_summarized_info"],
            "count",
            "reverse_compliment_count",
            "forward_reverse_ratio",
            "",
            "",
            "",
            output_files[group_name]["output_group_summarized_info"],
        ]
    )

    # calculate forward-reverse ratio of avg count by number of barcodes
    subprocess.call(
        [
            "python",
            calculate_ratio_between_columns_py,
            output_files[group_name]["output_group_summarized_info"],
            "avg_count_based_on_number_of_barcodes",
            "reverse_compliment_avg_count_based_on_number_of_barcodes",
            "avg_forward_reverse_ratio",
            "",
            "",
            "",
            output_files[group_name]["output_group_summarized_info"],
        ]
    )

    # add original sum read of promoter
    subprocess.call(
        [
            "python",
            join_specific_columns_py,
            output_files[group_name]["output_group_summarized_info"],
            output_files[group_name]["output_sum_promoter"],
            "promoter",
            "promoter",
            "count",
            "",
            "unnormalized_count",
            "left",
            "",
            "",
            "avg_count_based_on_number_of_barcodes",
            "False",
            output_files[group_name]["output_group_summarized_info"],
        ]
    )

# starting the first analyse pipeline - find relations between compared groups
for group in groups:
    group_name = group["name"]
    compared_groups = [g for g in groups if g["name"] != group_name]

    # gathering the normalized-filtered file path to compare with the current group file
    compared_summarized_info_files = [
        output_files[compared_group["name"]]["output_group_summarized_info"]
        for compared_group in compared_groups
    ]

    for compared_group in compared_groups:
        compared_group_name = compared_group["name"]
        columns_to_join = [
            "count",
            "avg_count_based_on_number_of_barcodes",
            "unnormalized_count",
        ]
        new_columns_names = [f"{compared_group_name}_{c}" for c in columns_to_join]
        columns_to_calculate_ratio = [
            "count",
            "avg_count_based_on_number_of_barcodes",
            "unnormalized_count",
        ]
        subprocess.call(
            [
                "python",
                join_specific_columns_py,
                output_files[group_name]["output_group_summarized_info"],
                output_files[compared_group_name]["output_group_summarized_info"],
                "promoter",
                "promoter",
                ",".join(columns_to_join),
                "",
                ",".join(new_columns_names),
                "left",
                "",
                "",
                "avg_count_based_on_number_of_barcodes",
                "False",
                output_files[group_name]["output_group_summarized_info"],
            ]
        )

        for column_to_calculate_ratio in columns_to_calculate_ratio:
            subprocess.call(
                [
                    "python",
                    calculate_ratio_between_columns_py,
                    output_files[group_name]["output_group_summarized_info"],
                    column_to_calculate_ratio,
                    f'{compared_group_name}_{column_to_calculate_ratio}',
                    f'{compared_group_name}_{column_to_calculate_ratio}_ratio',
                    "",
                    "",
                    "",
                    output_files[group_name]["output_group_summarized_info"],
                ]
            )
