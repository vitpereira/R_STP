

arm_from_cran <- c("flexdashboard", "learnr", "bookdown",
                   "officer", "rticles", "webshot",
                   "tidyverse", "remotes", "babynames", "magick")

install.packages(arm_from_cran, dependencies = TRUE)

arm_from_gh <- c('yihui/xaringan', 'rstudio/blogdown',
                 'rstudio-education/armcompanion', 
                 'haozhu233/kableExtra', 'apreshill/bakeoff',
                 'hebrewseniorlife/memor')

remotes::install_github(arm_from_gh, dependencies = TRUE)

webshot::install_phantomjs()

remotes::install_github('yihui/xaringan', dependencies = TRUE)

library(xaringan)

is_installed <- function(pkg_name){
  setNames(is.element(pkg_name, installed.packages()[, "Package"]), pkg_name)
} 
is_installed("xaringan")

install.packages("flexdashboard", dependencies = TRUE)

install.packages("learnr", dependencies = TRUE)

remotes::install_github('rstudio/blogdown', dependencies = TRUE)

blogdown::hugo_version() # to check your version
blogdown::update_hugo() # to force an update

install.packages("bookdown", dependencies = TRUE)

install.packages("officer", dependencies = TRUE)

install.packages("rticles", dependencies = TRUE)

remotes::install_packages("haozhu233/kableExtra", dependencies = TRUE)

install.packages("webshot", dependencies = TRUE)