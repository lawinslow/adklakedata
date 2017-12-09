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
#' set_local_path(tempdir())
#' sites = adk_lakes()
#'
#'
#' @export
adk_lakes = function(){
  return(adk_data('meta'))
}
