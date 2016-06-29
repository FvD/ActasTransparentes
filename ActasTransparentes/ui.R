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
# 

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Actas Transparentes"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      uiOutput("acta_sel")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       #textOutput("test_text"),
       plotOutput("wordcloud")
    )
  )
))
