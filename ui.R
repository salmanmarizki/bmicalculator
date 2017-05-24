shinyUI(fluidPage(
        titlePanel("Body Mass Index Calculator"),
        
        sidebarLayout(position ="right",
                sidebarPanel("What is Body Mass Index?",
                
                helpText("Body mass index (BMI) is a measure of body fat based on your weight in relation to your height, and applies to most adult men and women aged 20 and over. BMI is used as a screening tool to indicate whether a person is underweight, overweight, obese or a healthy weight for their height.

                         If a person's BMI is out of the healthy BMI range, their health risks may increase significantly.
                         
                         BMI values are age-independent and the same for both sexes. However, BMI may not correspond to the same degree of fatness in different populations due to different body proportions.
                         
                         (Heart Foundation)"),
        
                radioButtons(
                        inputId  = "units",
                        label    = "Units:",
                        choices  = c("Metric (kg & m)" = 1, "Imperial (lb & in)" = 2),
                        selected = 1
                ),
                
                numericInput(
                        inputId = "mass",
                        label = strong("Your weight:"),
                        value = 75
                ),
                
                numericInput(
                        inputId = "height",
                        label = strong("Your height:"),
                        value = 1.85,
                        step  = 0.10
                )
        ),
        
        mainPanel(
                uiOutput("input"),
                uiOutput("result"),
                uiOutput("graph"),
                h4(uiOutput("tips"))
        ))
))
