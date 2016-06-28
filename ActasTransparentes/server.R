# ActasTransparentes - SanCarlos-RUG
#
# Este archivo server.R contiene la lógica de la aplicación Shiny. En otras
# palabras, contiene la funcionalidad (lo que la aplicación necesita hacer).
#
# Si has abierto este archivo en RStudio puedes correrlo seleccionando 'Run
# App' arriba.
#
# Aprende como usar Shiny con el tutorial: http://shiny.rstudio.com/tutorial/

library(shiny)
library(rvest)
library(couchDB)
library(wordcloud)
library(tm)

# Define la lógica del servidor para la aplicación

shinyServer(function(input, output) {

 
  # Populate selection button
  conn <- couch_http_connection(host = "localhost")
  actas_docs <- couch_list_all_docs(conn, "actas_dev")
  # Aqui un metodo para obligar al resultado a un data frame
  actas_indice <- data.frame(matrix(unlist(actas_docs$rows),
                                    nrow=actas_docs$total_rows, 
                                    byrow=T))
  colnames(actas_indice) <- c("id", "key", "value")
  actas_seleccion <- as.vector(actas_indice$key)
 
  output$acta_sel <- renderUI({
    selectInput("acta_sel", "Selecciona un Acta", 
                choices=actas_seleccion, 
                selected=actas_seleccion[1])
  }) 
  
  output$test_text <- renderPrint(input$acta_sel)
  output$wordcloud <- renderPlot({
  # crear el wordcloud para el pdf seleccionado
    acta_texto <- couch_fetch(conn, "actas_dev", input$acta_sel)
      
    acta <- Corpus(VectorSource(acta_texto))
    acta <- tm_map(acta, content_transformer(tolower))
    acta <- tm_map(acta, removePunctuation)
    acta <- tm_map(acta, PlainTextDocument)
    acta <- tm_map(acta, removeWords, stopwords('spanish'))
    colpallette <- brewer.pal(8,"Dark2")
    wordcloud(acta, max.words = 100, random.order=FALSE, colors=colpallette)
    })
})
