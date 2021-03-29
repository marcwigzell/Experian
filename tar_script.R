# Create the _targets.R script -------------------------------------------------
tar_script(
  {
    # Install/load packages ----------------------------------------------------
    source("packages.R")
    rm(i)
    
    # Source user functions ----------------------------------------------------
    functions <- list.files("functions/", full.names = T)
    for (i in seq_along(functions))
      source(functions[i])
    rm(i, functions)
    
    # Set the packages and cache storage options for targets plan --------------
    tar_option_set(
      packages = packages,
      format = "fst_dt"
      )

    # List targets plan --------------------------------------------------------
    list(
      # Track arabica input data file ------------------------------------------
      tar_target(
        arabica_data_file,
        "coffee-quality-database/data/arabica_data_cleaned.csv",
        format = "file"
        ),
    
      # Import arabica data to targets cache -----------------------------------
      tar_target(
        arabica_data,
        fread(
          arabica_data_file
          )
        ),
    
      # Track robusta input data file ------------------------------------------
      tar_target(
        robusta_data_file,
        "coffee-quality-database/data/robusta_data_cleaned.csv",
        format = "file"
        ),
    
      # Import robusta data to targets cache -----------------------------------
      tar_target(
        robusta_data,
        fread(
          robusta_data_file
          )
        )
      )
  },
  ask = F
)

# Clean targets cache, if it exists --------------------------------------------
if (file.exists("_targets/"))
  tar_prune()

# Visualise targets plan -------------------------------------------------------
tar_visnetwork()

# Make the plan ----------------------------------------------------------------
tar_make()