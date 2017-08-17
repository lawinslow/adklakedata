#' @title Get metadata
#'
#' @param dataset_name character name of dataset. See \code{\link{adk_data}} documentation for dataset names.
#' 
#' @usage get_metadata("chem")
#'
#' @return Metadata about dataset
#' @export
get_metadata = function(dataset_name){
  dataset_name = match.arg(dataset_name, filenames)
  fname = system.file(paste0("extdata/", dataset_name, ".txt"), package = "adklakedata")
  metadata = readChar(fname, file.info(fname)$size)
  cat(metadata)
  return(invisible(metadata))
}