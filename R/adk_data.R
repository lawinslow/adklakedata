#' @title Load ADK Data
#' 
#' 
#' @description 
#' Loads data from locally downloaded CSV files. Run check_dl_data before using this function.
#' 
#' @param data_name A string choosing the data to load. Can be "chem", "rotifer", "phyto", "crustacean", "tempdo", or "meta".
#' 
#' @export

adk_data = function(data_name){
  data_name = tolower(data_name)
  path = local_path()
  filenames = c("chem" = "waterchem_cleaned.csv",
                "rotifer" = "rotifer_cleaned.csv",
                "phyto" = "phyto_cleaned.csv",
                "crustacean" = "crustacean_cleaned.csv",
                "tempdo" = "TempDOprofiles_all.csv",
                "meta" = "lake.typeandInfo.csv")
  return(read.csv(file.path(local_path(), filenames[[data_name]])))
}