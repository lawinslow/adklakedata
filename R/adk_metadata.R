#' @title Get data table metadata info
#'
#' @param data_name character name of dataset. See \code{\link{adk_data}} documentation for dataset names.
#' 
#' @return Metadata about each dataset. Includes units and long-name of parameters
#' 
#' @examples 
#' 
#' #Get chemistry metadata
#' adk_metadata('chem')
#' 
#' @export
adk_metadata = function(data_name){
  data_name = match.arg(data_name, names(filenames))
  fname = system.file(paste0("extdata/metadata/", file_path_sans_ext(filenames[data_name]), ".txt"), package = "adklakedata")
  metadata = readChar(fname, file.info(fname)$size)
  cat(metadata)
  return(invisible(metadata))
}