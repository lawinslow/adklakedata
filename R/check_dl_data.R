#' @title Download lake data from internet
#'
#'
#'
#' @description
#' Check that we have local cache of ADK lake data.
#' If it is not locally available, download the data
#' from the internet and prepare it for local use. This only
#' needs to be run once for each install of the package. Note:
#' you will be required to re-download data when a new version of
#' the package is released. This ensures stale data are not being
#' accidentally used.
#'
#'
#'
#' @import httr
#' @import rappdirs
#'
#'
#' @export


check_dl_data = function(){
  check_dl_file(system.file("extdata/master.csv", package = "adklakedata"))
}


local_path = function(){
  path = rappdirs::user_data_dir(appname = 'adklakedata', version=packageVersion('adklakedata'))
  if(!file.exists(path)){
    dir.create(path, recursive = TRUE)
  }
  return(path)
}

#' @title Return path to Adirondack Park Shapefile
#'
#'
#' @description
#' Downloads and unpacks the shapefile for the Adirondack Park
#' outline shapefile. Returns the path to a locally stored shapefile
#' that can be used for mapping an analysis.
#'
#'
#'
#' @import httr
#'
#' @export
adk_shape = function(){
  return(system.file("extdata", "BlueLine2014Poly.shp", package = "adklakedata"))
}

.onAttach = function(libname, pkgname){
  if(!file.exists(file.path(local_path(), 'waterchem_cleaned.csv'))){
    packageStartupMessage("data not downoaded, run check_dl_data()")
  }
}
