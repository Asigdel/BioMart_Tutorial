###############################################################
# ENSEMBL GENE IDS
# This is the Ensembl Gene IDs
# 2019-09-20
#############################################################

# Installing biomaRt 
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("biomaRt")

################################################
# Selecting a BioMart database and dataset
###############################################
library(biomaRt)
listMarts()

# Querying a database i.e. ensembl
ensembl <- useMart("ensembl")

############################################################
# Which datasets are available in the ensembl database
listDatasets(ensembl)
############################################################

#################################################################
# FRome ensembl database, let's access the dataset of bos taurus
#################################################################
ensembl <- useMart("ensembl", dataset = "btaurus_gene_ensembl")
ensembl

#################################################################
# How to build a biomaRt Query ?
# getBM() has 3 arguments: filters, attributes and values
# attributes define the values we are interested to retrieve
#################################################################
filters = listFilters(ensembl)


######################################################################################
# Annotate a set of Affymetrix identifiers with HUGO Symbols and chromosomal location
# of corresponding genes
######################################################################################

affyids=c("202763_at","209310_s_at","207500_at")
getBM(attributes = c('affy_hg_u133_plus_2', 'hgnc_symbol', 'chromosome_name',
                     'start_position', 'end_position', 'band'),
      filters = 'affy_hg_u133_plus_2', 
      values = affyids, 
      mart = ensembl)

listAttributes()


######################################################################################
# Annotate a set of EntrezGene identifiers with GO annotation
######################################################################################

entrez=c("673","837")
goids = getBM(attributes = c('entrezgene', 'go_id'), 
              filters = 'entrezgene', 
              values = entrez, 
              mart = ensembl)
head(goids)


goids = getBM(attributes = c('entrezgene', 'go_id'), 
              filters = 'entrezgene', 
              values = entrez, 
              mart = ensembl)
head(goids)