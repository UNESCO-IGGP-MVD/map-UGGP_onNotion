fluidPage(
  div(class = "map_container",
      tags$style(type = "text/css", ".map_container {position: fixed; top: 40px; left: 0; right: 0; bottom: 0; overflow: hidden; padding: 0}"),
      leafletOutput("map", width = "100%", height = "100%")
  )
)