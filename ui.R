library(shiny)
source("manipulation/modules.R")

shinyUI(
  navbarPage(
    "Discover RMarkdown Templates",
    tags$head(
      tags$link(rel = "stylesheet", href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.6/simplex/bootstrap.min.css"),
      tags$link(rel = "stylesheet", href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css")
    ),
    position = "static-top",
    fluid = F,
    windowTitle = "RMD templates on CRAN",
    ribbon_corner("https://github.com/haozhu233/rmd_templates_on_cran", 
                  fill_color = "#777777"),
    
    tabPanel(
      "List of templates", class = "active", icon = icon("rocket"),
      h2("RMarkdown Templates on CRAN", class="text-center"),
      tableOutput("rmd_templates_table"),
      tags$div(
        class = "well well-lg",
        h3("Notes:"),
        HTML(
          '1. This app currently runs real-time API pull from Github, which ',
          'takes time. Based on my personal experience, it takes roughly 10 ',
          'seconds. <br><br>',
          
          '2. This app takes benefit from the unofficial <a href="', 
          'https://github.com/cran">CRAN mirror on github</a> and completes ',
          'searching through Github API. <br><br>',
          
          '3. This app has a brother app, which use the same mechanism to ',
          'discover RStudio Addins. You can find it <a href="', 
          'https://github.com/haozhu233/rstudio_addins_on_cran">here</a>',
          '<br><br>',
          
          '4. There seems to be a bug on Github API that sometimes the API ',
          'search may miss one or two items. When this bug happened, it ',
          'took place at the initial data fetch step. There seems to be ',
          'nothing I can do... <br><br>'
        )
      )
    )
  )
)