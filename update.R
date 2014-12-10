message("Installing / updating HybRIDS and required packages")
chooseCRANmirror(ind = 83)
update.packages(ask=FALSE)
library(devtools)
install_github("ebailey78/shinyBS")
install_github("Ward9250/HybRIDS", build_vignettes = TRUE)


