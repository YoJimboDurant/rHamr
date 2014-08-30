#' @export
#' 
readQTH <- function(callsign, login, password){
hamQTH <- paste0("http://www.hamqth.com/xml.php?u=",login,
                 "&p=", password) 
session <- xmlTreeParse(hamQTH, useInternalNodes=TRUE)
session_id <- xmlToDataFrame(session)

callValue <-
  paste0("http://www.hamqth.com/xml.php?id=",session_id$session_id,"&callsign=",callsign,"&prg=rHamr")
hamDf <- ldply(callValue, function(cV){
  xmlToDataFrame(xmlTreeParse(cV, useInternalNodes=TRUE))
}, .progress='text')
hamDf$longitude <- as.numeric(as.character(hamDf$longitude))
hamDf$latitude <- as.numeric(as.character(hamDf$latitude))
hamDf$call <- tolower(as.character(hamDf$call))
hamDf
}