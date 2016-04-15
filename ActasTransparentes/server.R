# ActasTransparentes - SanCarlos-RUG
#
# Este archivo server.R contiene la lógica de la aplicación Shiny. En otras
# palabras, contiene la funcionalidad (lo que la aplicación necesita hacer).
#
# Si has abierto este archivo en RStudio puedes correrlo seleccionando 'Run
# App' arriba.
#
# Aprende como usar Shiny con el tutorial: http://shiny.rstudio.com/tutorial/
# 

library(shiny)
library(rvest)
library(wordcloud)
library(tm)

# Define la lógica del servidor para la aplicacióni

shinyServer(function(input, output) {

  bajar_pdf <- observeEvent(input$downloadButton, { 
    # bajar el archivo correspondiente al mes seleccionado 
    if (is.null(input$acta_sel)) {
      return(c())
    }
    
    if (input$acta_sel == "201507") {
     download.file("http://www.munisc.go.cr/Documentos/Secciones/48/Acta%2039%20de%20fecha%2003%20julio%202015.pdf", 
       destfile = paste(input$acta_sel, ".pdf", sep = ""),
       mode = "wb")
    }
    
    if (input$acta_sel == "201601") {
     download.file("http://www.munisc.go.cr/Documentos/Secciones/49/Acta%2001%20de%20fecha%2004%20enero%202016.pdf", 
       destfile = paste(input$acta_sel, ".pdf", sep = ""),
       mode = "wb")
    }
  })

  output$wordcloud <- renderPlot({
  # crear el wordcloud para el pdf seleccionado
      
    pdf_acta <- readPDF(control = list(text = 
                "-layout"))(elem = list(
                  uri = paste(input$acta_sel, ".pdf", sep="")),
                             language = "es",
                             id = "id1")
    
    if (is.null(pdf_acta)) {
      return(c())
    }
  
    acta <- Corpus(VectorSource(pdf_acta$content))
    acta <- tm_map(acta, content_transformer(tolower))
    acta <- tm_map(acta, removePunctuation)
    acta <- tm_map(acta, PlainTextDocument)
    acta <- tm_map(acta, removeWords, stopwords('spanish'))
    colpallette <- brewer.pal(8,"Dark2")
    wordcloud(acta, max.words = 1000, random.order=FALSE, colors=colpallette)
    })
})
