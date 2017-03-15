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

  dataurl = 'https://ndownloader.figshare.com/files/7797520?private_link=524a51a33a9104602f32'

  #check to see if we have local copy of files,
  # for now, just see if we have waterchem file, may replace by list of files later
  if(file.exists(file.path(local_path(), 'waterchem_cleaned.csv'))){
    return()
  }

  #if we get here, we don't have the files locally, so download and extract

  #dl file to temp location
  ziptemp = tempfile(fileext = '.zip')
  r = RETRY('GET', dataurl, write_disk(ziptemp, overwrite=TRUE))
  stop_for_status(r)
  #extract files to
  unzip(ziptemp, exdir = local_path())
}


local_path = function(){
  path = rappdirs::user_data_dir(appname = 'adklakedata', version=packageVersion('adklakedata'))
  if(!file.exists(path)){
    dir.create(path, recursive = TRUE)
  }
}
