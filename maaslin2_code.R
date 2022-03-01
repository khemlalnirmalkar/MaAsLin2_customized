##masslin2
## Author Khem, Date Oct 14th, 2021
https://github.com/biobakery/biobakery/wiki/maaslin2   ### full explanation

https://github.com/biobakery/Maaslin2   ##maaslin2 info
http://huttenhower.sph.harvard.edu/maaslin ##detail and maaslin2 option info

library(Maaslin2)
library(Rcpp)    #otherwise possible error Function 'Rcpp_precious_remove' not provided by package 'Rcpp
#if still same error, reinstall Rcpp otherwise reinstall Maaslin2
input_data <- system.file(
    'extdata','HMP2_taxonomy.tsv', package="Maaslin2")
input_metadata <-system.file(
    'extdata','HMP2_metadata.tsv', package="Maaslin2")
fit_data <- Maaslin2(
    input_data, input_metadata, 'demo_output', transform = "AST",
    fixed_effects = c('diagnosis', 'dysbiosisnonIBD','dysbiosisUC','dysbiosisCD', 'antibiotics', 'age'),
    random_effects = c('site', 'subject'),
    normalization = 'NONE',
    standardize = FALSE)

************
metabolites<-read.table("plasma_metabolites01.txt", sep = "\t", header = T, check.names = F)

meta<-read.table("plasma_metadata_v02.txt", sep = "\t", header = T, check.names = F)

fit_data <- Maaslin2(
    metabolites, meta, 'plasma_outputTest', transform = "NONE",
    fixed_effects = c('Group','DiaOrConsti', 'SRS','CARS','GSRS', 'PGIRDIFF', 'DeliveryMode', 'age', 'rectalOralTreat','BMI','BreastFeedMonth','RESPOND','weightpound','ABC','VancomycinRXN'),
    random_effects = c('Group', 'GSRS', 'SRS', 'CARS', 'DeliveryMode'),
    normalization = 'NONE',
    standardize = FALSE, correction = "BH",)

## ***** OR

fit_data <- Maaslin2(
    metabolites, meta, 'test4', transform = "NONE",
    fixed_effects = c('DiaOrConsti', 'ABC', 'CARS', 'GROUP', 'GSRS'),
    random_effects = c('NONE'),
    normalization = 'NONE',
    standardize = FALSE, correction = "BH",analysis_method = "LM")
###

fit_data <- Maaslin2(
    metabolites, meta, 'output_GrpRandmEfct', transform = "NONE",
    fixed_effects = c('DiaOrConsti', 'SRS','CARS','GSRS', 'PGIRDIFF', 'DeliveryMode', 'age', 'rectalOralTreat','BMI','BreastFeedMonth','RESPOND','weightpound','ABC','VancomycinRXN'),
    random_effects = c('Group'),
    normalization = 'NONE',
    standardize = FALSE, correction = "BH",analysis_method = "LM")
