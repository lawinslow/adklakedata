filenames = c("chem" = "waterchem.csv",
              "crustacean" = "crustacean.csv",
              "meta" = "lake_characteristics.csv",
              "nutrient" = "nutrients.csv",
              "phyto" = "phyto.csv",
              "rotifer" = "rotifer.csv",
              "secchi" = "secchi.csv",
              "tempdo" = "temp_do_profiles.csv")

#' @title Load ADK Data
#' 
#' @description 
#' Loads data from locally downloaded CSV files. Run \code{\link{check_dl_data}} before using this function.
#' 
#' @param data_name A string choosing the data to load. 
#' \tabular{ll}{
#' \strong{data_name} \tab \strong{data file loaded} \cr
#' chem \tab waterchemALTM1994_2012.csv \cr
#' crustacean \tab crustacean_withbiomass.csv \cr
#' meta \tab lake.typeandInfo.csv \cr
#' nutrient \tab nutrient.csv \cr
#' phyto \tab phyto_withbiomass.csv \cr
#' rotifer \tab rotifer_withbiomass.csv \cr
#' secchi \tab secchi.csv \cr
#' tempdo \tab temp_do_profiles.csv \cr
#' }
#' 
#' @export
adk_data = function(data_name){
  data_name = tolower(data_name)
  data_name = match.arg(data_name, names(filenames))
  path = local_path()
  check_dl_data()
  
  return(read.csv(file.path(local_path(), filenames[[data_name]])))
}