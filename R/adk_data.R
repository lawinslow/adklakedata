filenames = c("chem" = "waterchem.csv",
              "crustacean" = "crustacean.csv",
              "meta" = "lake_characteristics.csv",
              "nutrient" = "nutrients.csv",
              "phyto" = "phyto.csv",
              "rotifer" = "rotifer.csv",
              "secchi" = "secchi.csv",
              "tempdo" = "temp_do_profiles.csv", 
              "met" = "nldas_drivers_1979_2016.csv")

#' @title Load ADK Data
#' 
#' @description 
#' Loads data from locally downloaded CSV files. Run \code{\link{check_dl_data}} before using this function.
#' 
#' @param data_name A string choosing the data to load. 
#' \tabular{ll}{
#' \strong{Data name (data_name)} \tab \strong{Data Description} \cr
#' chem \tab Lake Chemistry \cr
#' crustacean \tab Crustacean Zooplankton Biomass \cr
#' meta \tab Lake-specific metadata (type, location, morphology) \cr
#' nutrient \tab Lake Nutrients \cr
#' phyto \tab Phytoplankton Biomass Observations \cr
#' rotifer \tab Rotifer Zooplankton Biomass \cr
#' secchi \tab Lake Secchi Depth Observations \cr
#' tempdo \tab Temperature and Dissolved Oxygen Profiles \cr
#' met    \tab Lake-specific Meterology (air temp, wind, precip, etc) \cr
#' }
#'
#' 
#' @import utils 
#' 
#' @examples 
#' # set temp directory as local path
#' set_local_path(tempdir())
#' 
#' #grab secchi data and plot it
#' secchi = adk_data('secchi')
#' plot(as.POSIXct(secchi$date), secchi$secchi)
#' 
#' @export
adk_data = function(data_name){
  data_name = tolower(data_name)
  data_name = match.arg(data_name, names(filenames))
  path = local_path()
  check_dl_data()
  
  return(read.csv(file.path(local_path(), filenames[[data_name]])))
}
