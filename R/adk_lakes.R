#' @title List of lakes with attributes
#'
#'
#' @description
#' Returns a data.frame of lake info. Includes common info like
#' lake location (lat/lon), lake name, and numerical site ID.
#'
#'
#'
#' @examples
#'
#' sites = adk_lakes()
#'
#'
#' @export
adk_lakes = function(){

  sites = read.table(file.path(local_path(), 'ALTM_AEAP_Name_Coordinates_THL.csv'), sep=',', header=TRUE, quote='')
  return(sites)
}
