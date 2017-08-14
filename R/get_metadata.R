#' @title Get metadata
#'
#' @param dataset_name 
#'
#' @return Metadata about dataset
#' @export
get_metadata = function(dataset_name){
  fname = system.file(paste0("extdata/", dataset_name, ".txt"), package = "adklakedata")
  metadata = readChar(fname, file.info(fname)$size)
  cat(metadata)
}