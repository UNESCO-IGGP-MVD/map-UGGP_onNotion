convertJsonToDf <- function (results_lst) {
  extractValueFromLst <- function(prop_lst ,col_name, col_type) {
    prop_info <- prop_lst[[col_name]][[col_type]] 
    
    if (is.null(prop_info) | is_empty(prop_info)) {
      return(tibble(NA) %>% `colnames<-`(col_name))
    }
    
    switch (col_type,
            "title" = {
              col_value <- prop_info[[1]][["text"]][["content"]]
            },
            "select" = {
              col_value <- prop_info[["name"]]
            },
            "multi_select" = {
              col_value <- prop_info[[1]][["name"]]
            },
            "rich_text" = {
              col_value <- prop_info[[1]][["text"]][["content"]]
            },
            {
              col_value <- prop_info
            }
    )
    
    return(tibble(col_value) %>% `colnames<-`(col_name))
  }
  
  col_index_df <- c(
    "show_on_map"      = "checkbox",
    "latitude"         = "number",
    "longitude"        = "number",
    "name"             = "title",
    "regional_network" = "select",
    "country"          = "multi_select",
    "designated_year"  = "number",
    "area_size"        = "number",
    "quote"            = "rich_text"
  ) %>% as_tibble(rownames = "col_name") %>% 
    rename(col_type = value)  
  
  result <- results_lst$results[[1]]
  
  output_lst <- list()
  
  for (result in results_lst$results) {
    output_lst <- append(
      output_lst,
      map2_dfc(
        col_index_df$col_name, col_index_df$col_type,
        ~extractValueFromLst(prop_lst = result$properties, .x, .y)
      ) %>% list()
    )
  }
  
  output_df <- reduce(output_lst, bind_rows)
  
  return(output_df)  
}