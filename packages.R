packages <- c(
  "targets",
  "tarchetypes",
  "data.table",
  "clustMixType",
  "magrittr",
  "fst",
  "visNetwork",
  "renv",
  "rmarkdown",
  "factoextra"
)

for (i in seq_along(packages)) 
  if (!packages[i] %in% installed.packages())
    install.packages(packages[i])

