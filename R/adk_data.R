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
  if(data_name == "chem"){
    return(read.csv(file.path(local_path(), "waterchem_cleaned.csv")))
  }
  else if(data_name == "rotifer"){
    return(read.csv(file.path(local_path(), "rotifer_cleaned.csv")))
  }
  else if(data_name == "phyto"){
    return(read.csv(file.path(local_path(), "phyto_cleaned.csv")))
  }
  else if(data_name == "crustacean"){
    return(read.csv(file.path(local_path(), "crustacean_cleaned.csv")))
  }
  else if(data_name == "tempdo"){
    return(read.csv(file.path(local_path(), "TempDOprofiles_all.csv")))
  }
  else if(data_name == "meta"){
    return(read.csv(file.path(local_path(), "lake.typeandInfo.csv")))
  }
}