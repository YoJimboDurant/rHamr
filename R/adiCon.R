#' @export
adiCon <- function(adiLine){ 
  adiData <- str_match_all(adiLine, ">(.*?)<")
  
  adiHeader <- str_match_all(adiLine, "<(.*?)>")
  
  dfx <- data.frame(t(adiData[[1]][,2]))
  nameCols <- adiHeader[[1]][,2]
  nameCols <- gsub(":.*", "", nameCols)
  names(dfx) <- nameCols[nameCols != "EOR"]
  dfx
}
