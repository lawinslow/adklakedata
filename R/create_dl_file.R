#' @title Create master file for use in check_dl_file
#' 
#' @param master_file Character path to export csv
#' @param urllist Character vector of URLs
#' @param filelist Character vector of files
#' 
#' @import tools
#' 
#' @keywords internal
create_dl_file = function(master_file, urllist, filelist){
  hashes = md5sum(filelist)
  dl_file = data.frame(urllist, filelist, hashes)
  colnames(dl_file) = c("URL", "filename", "MD5")
  write.csv(dl_file, master_file, row.names = FALSE)
}