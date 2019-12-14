#


library(shiny)


shinyUI(fluidPage(
  
  #  App Title
  
  titlePanel("Next word prediction"),
  
  # Application subtitle
  
  fluidRow(
    column(12,
           h4(" This app takes as input a phrase (multiple words) in a text box input and outputs a prediction of the next word.")
    )
  ),
  
  tags$hr(style="border-color: black;"),
  
  # Sidebar panel with: select box to select n-gram model and with help text ----
  sidebarPanel(
    
    
    # Select box with a select input for each n-gram model
    
    
    selectInput("model", label = "Select ngram model data source:", 
                
                choices = list("News articles data" = 1, "Twitter data" = 2), 
                
                selected = 1),
    
    tags$b("App user instruction:"),
   
    helpText("To run the application, type a phrase or a word in the box provided to the right here"),
    
   
    tags$hr(style="border-color: black;"),
    
    tags$b("App demonstration for users:"),
   
    helpText("Enter a word or phrase:"), tags$i("That's good"),
    helpText("Cleaned text phrase or word:"), tags$i("good"),
    helpText("If you selected ngram model source - News articles:"), tags$i("Predicted next word= news"),
    helpText("If you select ngram model source - Twitter data:"), tags$i("Predicted next word= morning")
  ),
  
  
  # Main panel with: input for enter text phrase, submit button, 
  # output for cleaned text phrase and output for single word prediction
  
  mainPanel(
    
    
    # Input box to enter text phrase without last word
    br(),  
    textAreaInput("textInput", label = "Enter text phrase without the last word:", value = "", width = "100%", rows = 6),
    
    # Include clarifying text ----
    
   
    helpText("Press submit button below to predict the next word."),
    
    # Action button to submit entered text phrase
    actionButton("action", label = tags$b("submit"), width = "25%"),
    
    # Action button to clear entered text phrase
    
    actionButton("reset", label = tags$b("Clear"), width = "25%"),
    
    # Include clarifying text ----
    
    helpText("Press clean button above to clean entered text phrase."),
    
    
    tags$b("Cleaned text phrase:"),
    
    # Output box to display cleaned text phrase
    
    verbatimTextOutput("cleanedText", placeholder = TRUE),
    
    tags$b("Predicted next word:"),
    
    # Output box to display predicted word
    
    fluidRow(column(4, verbatimTextOutput("predictedWord", placeholder = TRUE)))
    
  )
  
    ))