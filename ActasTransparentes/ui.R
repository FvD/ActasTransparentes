# ActasTransparentes - SanCarlos-RUG
# 
# Esta arhivo ui.R contiene la definición de la interfaz de la aplicación
# Shiny. En otras palabras, contiene las instrucciones de como mostrar la
# aplicación en el navegador.
#
# Si has abierto este archivo en RStudio puedes correrlo seleccionando 'Run
# App' arriba.
#
# Aprende como usar Shiny con el tutorial: http://shiny.rstudio.com/tutorial/

library(shiny)
library(shinydashboard)

sidebar <- dashboardSidebar(
      uiOutput("acta_sel"),
      sliderInput(inputId = "no_palabras", "Numero Palabras", min=30, max=500, value=100)
)

body <- dashboardBody(    
       plotOutput("wordcloud")
)


dashboardPage(
  dashboardHeader(title = "ActasTransparentes"),
  sidebar,
  body
)
