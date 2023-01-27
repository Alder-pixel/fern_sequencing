# __file__ Makefile
# __author__ Alder Fulton

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

DATA_DIR := $(ROOT_DIR)/data  # This may not be in the root directory.
RESULTS_DIR := $(ROOT_DIR)/results  # Many of the batch files will pull data from here.
SOURCE_DIR := $(ROOT_DIR)/src
EXPRESSION_DATA := /mnt/research/edgerpat_lab/MSU_GenomicsCore_Sequencing_2018/VaccBSGW_Bnap_20181005_RNASeq_PE150/VaccBSGW
ADAPTOR_FASTA_FILE := $DATA_DIR/adaptors/TruSeq3-PE.fa

EXPRESSION_FILE_NAMES :=  $(DATA_DIR)/expression_file_names.txt

# Commented out because I am having issues
# create_dirs:
# 	[-d $(DATA_DIR)] || mkdir $(DATA_DIR)
# 	[-d $(RESULTS_DIR)] || mkdir $(RESULTS_DIR)
# 	[-d $(SOURCE_DIR)] || mkdir $(SOURCE_DIR)

gen_expression_file_names:
	ls $(EXPRESSION_DATA) > $(DATA_DIR)/$(EXPRESSION_FILE_NAMES)

trimmomatic:
	sbatch $(SOURCE_DIR)/trimmomatic.sb


