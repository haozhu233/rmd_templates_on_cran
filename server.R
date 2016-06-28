library(shiny)

shinyServer(function(input, output, session) {
  
  source("manipulation/global.R")
  suppressWarnings(source("manipulation/fetch.R"))
  
  rmd_templates_tbl <- templates_list %>%
    arrange(repo_name, name)
  
  output$rmd_templates_table <- function(){
      kable(
        rmd_templates_tbl, 
        col.names = c("Package", "Template Name", "Template Description"),
        format = "html", output = F, align = c("l", "l", "l", "c", "l"), 
        escape=F, table.attr="class='table table-striped table-hover'"
      )
  }
  
})