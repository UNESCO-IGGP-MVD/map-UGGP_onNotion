output$map <- renderLeaflet({
  source("scp/bin/createPopupHTML.R", local = TRUE)
  
  
  DB$geopark %>% 
    filter(show_on_map) %>% 
  leaflet() %>% 
    # providers and selectors
    addProviderTiles("CartoDB.Positron", group = "CartoDB") %>% 
    addProviderTiles("Esri.WorldTopoMap", group = "WorldTopoMap") %>% 
    addProviderTiles("Esri.WorldPhysical", group = "WorldPhysical") %>% 
    addProviderTiles("Esri.WorldImagery", group = "WorldImagery") %>% 
    addLayersControl(
      baseGroups = c("CartoDB", "WorldTopoMap", "WorldPhysical", "WorldImagery"),
      # overlayGroups = c("UNESCO Global Geopark", "Aspiring Geopark", "Geopark Project"),
      options = layersControlOptions(collapsed = FALSE)
    ) %>% 
    # search function
    addSearchOSM() %>% 
    addCircleMarkers(lat = ~latitude, lng = ~longitude, label = ~name,
                     # popup = ~quote,
                     popup = createPopupHTML(),
                     color = "orangered", opacity = 1, weight = 2.5, radius = 5,
                     fillColor = "coral", fillOpacity = 1
                     ) %>% 
    # reset
    addResetMapButton()
})

