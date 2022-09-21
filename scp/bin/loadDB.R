source("scp/bin/DB/getJsonFromNotion.R", local = TRUE)
source("scp/bin/DB/convertJsonToDf.R", local = TRUE)

list(
  geopark = getJsonFromNotion() %>% 
    convertJsonToDf()
)
















