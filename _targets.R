library(targets)
source("packages.R")
rm(i)
functions <- list.files("functions/", full.names = T)
for (i in seq_along(functions)) source(functions[i])
rm(i, functions)
tar_option_set(packages = packages, format = "fst_dt")
list(tar_target(arabica_data_file, "coffee-quality-database/data/arabica_data_cleaned.csv", 
    format = "file"), tar_target(arabica_data, fread(arabica_data_file)), 
    tar_target(robusta_data_file, "coffee-quality-database/data/robusta_data_cleaned.csv", 
        format = "file"), tar_target(robusta_data, fread(robusta_data_file)))
