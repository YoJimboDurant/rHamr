#' @export
#' 
qthMap <- function(dfx){
  mapWorld <- borders("world", colour="red", fill="white")
  g1 <- ggplot() + 
    mapWorld + 
    geom_path() 
    
  g1 + geom_point(data=dfx, aes(x=longitude, y=latitude))
}