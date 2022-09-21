## app.R ##

# LIBRARY -----------------------------------------------------------------
library(shiny)
library(htmltools)
library(tidyverse)
library(httr)
library(jsonlite)
library(leaflet)
library(leaflet.extras)
# SOURCE ------------------------------------------------------------------

DB <- source("scp/bin/loadDB.R")$value

# SERVER ------------------------------------------------------------------

server <- function(input, output) {
  source("scp/srv-map.R", local = TRUE)
}


# UI ----------------------------------------------------------------------

ui <- navbarPage("Mapa de Los Geoparques Mundiales de la UNESCO",
  tabPanel("MAPA",source("ui/ui-map.R", local = TRUE)$value),
  # tabPanel("Fun Facts"),
  tabPanel("Sobre el Mapa")
)


# RUN ---------------------------------------------------------------------

shinyApp(ui = ui, server = server)