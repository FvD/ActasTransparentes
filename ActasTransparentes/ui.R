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
  sidebarMenu(
    menuItem("Tablero central", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Nube Palabras", tabName = "nube_palabras", icon=icon("cloud"),
            menuSubItem("Genera nube", tabName = "palabras"),
              uiOutput("acta_sel"),
             sliderInput(inputId = "no_palabras", 
                        "Numero Palabras", 
                        min=30, max=500, value=100)),
    menuItem("Busquedas", tabName = "busquedas", icon = icon("search"))
  )
)

body <- dashboardBody(    
  tabItems(
    tabItem(tabName = "dashboard",
            h2("Tablero de Actas Transparentes"),
            fluidRow(
              # A static valueBox
              valueBox(90, "Actas procesadas", icon = icon("file-pdf-o"), color = "green"),
              
              # Dynamic valueBoxes
              valueBox(2, "Actas Nuevas", icon = icon("files-o"), color = "blue"),
              
              valueBox(3, "Numero de usuarios", icon = icon("users"), color = "orange")
              
            )
    ),
    
    tabItem(tabName = "palabras",
            h2("Nube de Palabras"),
            plotOutput("wordcloud")
    ),
  
   tabItem(tabName = "busquedas",
          h2("Busquedas en Actas")
   )
  )
)

dashboardPage(skin="green",
  dashboardHeader(title = "ActasTransparentes"),
  sidebar,
  body
)
