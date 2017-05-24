source("./bmi.R")

shinyServer(function(input, output) {
        output$input <- renderText({
                if (input$units == METRIC) {
                        unit.weight = "kg"
                        unit.height = "m"
                } else {
                        unit.weight = "lb"
                        unit.height = "in"
                }
                
                paste0("You are ", "<strong>",input$mass, " ", unit.weight, " @ ", input$height, " ", unit.height, "</strong>")
        })
        
        output$result <- renderText({
                bmi = bmi(mass = input$mass, height = input$height, units = input$units)
                
                if      (bmi <  15.0) info = "<span style='color: red'>Very severely underweight</span>"
                else if (bmi <= 16.0) info = "<span style='color: red'>Severely underweight</span>"
                else if (bmi <= 18.5) info = "<span style='color: orange'>Underweight</span>"
                else if (bmi <= 25.0) info = "<span style='color: green'>Normal (healthy weight)</span>"
                else if (bmi <= 30.0) info = "<span style='color: orange'>Overweight</span>"
                else                  info = "<span style='color: red'>Obese Class I (Moderately obese)</span>"
                
                paste0("Your BMI is ", "<code>", round(bmi, 2), "</code>", ", which is: ", info)
        })
        
        output$graph <- renderText({
                "<img style='width: 40em; margin-top: 1em' src='https://cdn.vertex42.com/ExcelTemplates/Images/bmi-chart.gif' title='Body mass index chart (Vertex42)' />"
        })
        
        output$tips <- renderText({
                bmi = bmi(mass = input$mass, height = input$height, units = input$units)
                
                if      (bmi <  15.0) {info = "<span style='color: red'>Very severely underweight</span> 
                                      <br> Here are some tips to go for the optimal BMI: 
                                      <br> - Eat more healthy quality food, <storng>no</strong> processed food.
                                      <br> - Eat lots and lots of fruits and vegetables.
                                      <br> - Exercise regularly, keeping yourself healthy and boost your immune system is vital for your health."
                                      
                }
                else if (bmi <= 16.0) {info = "<span style='color: red'>Severely underweight</span>
                                      <br> Here are some tips to go for the optimal BMI: 
                                      <br> - Eat more healthy quality food, <strong>no</strong> processed food.
                                      <br> - Eat lots and lots of fruits and vegetables.
                                      <br> - Exercise regularly, keeping yourself healthy and boost your immune system is vital for your health.
                  "
                }
                else if (bmi <= 18.5) {info = "<span style='color: orange'>Underweight</span>
                                      <br> Here are some tips to go for the optimal BMI: 
                                      <br> - Eat more healthy quality food, <strong>minimize</strong> processed food and junk food.
                                      <br> - Eat lots and lots of fruits and vegetables.
                                      <br> - Exercise regularly, keeping yourself healthy and boost your immune system is vital for your health."
                }
                else if (bmi <= 25.0) {info = "<span style='color: green'>Normal (healthy weight)</span>
                                      <br> Here are some tips to maintain your optimal BMI: 
                                      <br> - Keep eating healthy quality food, <strong>minimize</strong> processed food and junk food.
                                      <br> - Keep a good track of fruits and vegetables.
                                      <br> - Keep exercising regularly to keep yourself healthy and boost your immune system."
                }
                else if (bmi <= 30.0) {info = "<span style='color: orange'>Overweight</span>, you might want to monitor your body weight.
                                      <br> Here are some tips to lose some weight to get to the optimal BMI: 
                                      <br> - <strong>DO</strong> eat healthy quality food, <strong>AVOID</strong> processed food and junk food.
                                      <br> - Have a good intake of fruits and vegetables.
                                      <br> - <strong>DO</strong> exercise regularly to keep yourself healthy, boost your immune system and of course lose weight.
                                      <br> - Of course on top of all that, do have an intake deficit since without it, you will not lose weight at all."
                }
                else                 {info = "<span style='color: red'>Obese</span>, you might want to lose some of your body weight to have a healthy lifestyle.
                                      <br> Here are some tips to lose some weight to get to the optimal BMI: 
                                      <br> - <strong>DO</strong> eat healthy quality food, <strong>AVOID</strong> processed food and junk food.
                                      <br> - Have a good intake of fruits and vegetables.
                                      <br> - <strong>DO</strong> exercise regularly to keep yourself healthy, boost your immune system and of course lose weight.
                                      <br> - Of course on top of all that, do have an intake deficit since without it, you will not lose weight at all.
                                      <br> - If you are unable to move much, it is recommended for you to see a doctor regarding your issue. Their judgement and consultation will best fit your situation."
                }
                paste0("Since your BMI is ", info)
                
        })
        
        
})