load_package <- function(x){
  for( i in x ){
    #  require returns TRUE invisibly if it was able to load package
    if( ! require( i , character.only = TRUE ) ){
      #  If package was not able to be loaded then re-install
      install.packages( i , dependencies = TRUE )
      #  Load package after installing
      require( i , character.only = TRUE )
    }
  }
}

required_package <- c("sas7bdat", "MASS", "tidyverse", "foreach", "doRNG", "doParallel")
load_package(required_package)

## better trace back
if (!require("devtools")) install.packages("devtools")
devtools::install_github("robertzk/bettertrace")
library(bettertrace) # options(error = bettertrace::stacktrace)