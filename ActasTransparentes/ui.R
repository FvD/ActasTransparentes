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
       selectInput("acta_sel",
                   "Selecciona Acta",
                   choices = c("Julio 2015" = "201507",
                               "Enero 2016" = "201601")
       ),
       actionButton("downloadButton", "Procesar Acta")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("wordcloud")
    )
  )
))
