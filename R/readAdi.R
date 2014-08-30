#' Reads an ADIF formatted ham radio file and returns a data.frame
#' 
#' This function does blah blah and more blah


#' @export
readAdi <- function(f=file.choose(), nskip=6){
  adiFile <- readLines(f)
  stopifnot(is.character(adiFile))
  adi <- llply(adiFile[nskip:length(adiFile)], function(x) x)
  adiFile <- ldply(adi, rHamr::adiCon)
  adiFile$date <- ymd_hms(paste(adiFile$QSO_DATE, adiFile$TIME_ON))
  adiFile$date_off <- ymd_hms(paste(adiFile$QSO_DATE_OFF, adiFile$TIME_OFF))
  adiFile
}