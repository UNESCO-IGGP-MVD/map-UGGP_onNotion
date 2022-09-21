getJsonFromNotion <- function(
  database_id = "9bdbaebb2ae94760a51fcd5269debc1b",
  notion_token = "secret_yFDSan8op6s20HGEe5F4l1DTSyRu0mItBu1GjHUJIjL"
) {
  # notion_token <- "secret_yFDSan8op6s20HGEe5F4l1DTSyRu0mItBu1GjHUJIjL"
  # database_id <- "9bdbaebb2ae94760a51fcd5269debc1b"

  url <- str_c("https://api.notion.com/v1/databases/", database_id,"/query")
  
  payload <- "100"
  
  response <- VERB(
    "POST", url,
    body = str_c("{\"page_size\":", payload, "}"),
    add_headers('Notion-Version' = '2022-06-28', 'authorization' = str_c('Bearer ', notion_token)),
    content_type("application/json"),
    accept("application/json"),
    encode = "json" 
  )
  
  output <- content(response, "text") %>% 
    fromJSON(simplifyDataFrame = F)
  
  return(output)
}