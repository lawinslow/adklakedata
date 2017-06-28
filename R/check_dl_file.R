#' @title Verify and download data files
#' 
#' @description 
#' Checks if local data files as defined in master file exist and match MD5 hash. Downloads data if necessary.
#' 
#' @param master_file Character path to master file
#' @param fname Character vector of specific file names to check
#' @param md5check boolean
#' @param dest Character path to download destination
#' 
#' @import httr
#' @import tools


check_dl_file = function(master_file, fname = NULL, md5check = TRUE, dest=local_path()){
  files = read.csv(master_file)
  if(!is.null(fname)){
   files = files[files$filename == fname,]
  }
  apply(files, 1, function(x){
    if(!file.exists(file.path(dest, x["filename"]))){
      r = RETRY("GET", url=x["URL"], write_disk(file.path(dest,x["filename"]), overwrite=TRUE), times = 2)
      stop_for_status(r)
      if(!file.exists(file.path(dest, x["filename"]))){
        stop("Data downloaded was incomplete or corrupted - please try again later or submit a bug report.")
      }
      if(md5sum(file.path(dest, x["filename"])) != x["MD5"]){
        file.remove(file.path(dest, x["filename"]))
        stop("Data downloaded was incomplete or corrupted - please try again later or submit a bug report.")
      }
    }
  })
  if(md5check){
    apply(files, 1, function(x){
     if(md5sum(file.path(dest, x["filename"])) != x["MD5"]){
       r = RETRY("GET", url=x["URL"], write_disk(file.path(dest, x["filename"]), overwrite=TRUE))
       stop_for_status(r)
       if(!file.exists(file.path(dest, x["filename"]))){
         stop("Data downloaded was incomplete or corrupted - please try again later or submit a bug report.")
       }
       if(md5sum(file.path(dest, x["filename"])) != x["MD5"]){
         file.remove(file.path(dest, x["filename"]))
         stop("Data downloaded was incomplete or corrupted - please try again later or submit a bug report.")
       }
     }
    })
  }
 }