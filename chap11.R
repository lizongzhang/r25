library(tidyverse)
data(mpg)

#选择数值型的列
mpg %>% 
  select(where(is.numeric)) %>% 
  cor() %>% 
  round(3)

library(corrplot)

mpg %>% 
  select(displ, cyl, cty, hwy) %>% 
  cor() %>% 
  corrplot(col = c(4,5),
           tl.col = "blue4",
           type = "upper",
           addCoef.col = "white",
           number.digits = 3
           )

library(psych)
mpg %>% 
  select(displ, cyl, cty, hwy) %>% 
  corr.test() 

gr <- colorRampPalette(c("purple",
                         "white", 
                         "cyan"))  

mpg %>% 
  select(displ, cyl, cty, hwy) %>% 
  cor.plot(stars = TRUE,
           cex = 0.8, 
           gr = gr) 

mtcars %>% 
  select(mpg:qsec) %>% 
  cor.plot(stars = TRUE,
           cex = 0.8, 
           gr = gr) 



# regression --------------------------------------------------------------

mpg %>% 
  lm(cty ~ displ, .)

library(ggpubr)
mpg %>% 
  ggplot(aes(displ, cty)) +
  geom_point() +
  geom_smooth(method = "lm") +
  stat_regline_equation(label.x = 3,
                        label.y = 30,
                        col = "blue")

mpg %>% 
  ggplot(aes(displ, cty)) +
  geom_point(col = "red") +
  geom_smooth(method = "lm") +
  stat_regline_equation(aes(label = paste(..eq.label..,
                                          ..rr.label..,
                                          sep = "~~~")),
                        label.x = 3,
                        label.y = 30,
                        col = "blue")


mpg %>% 
  ggplot(aes(displ, cty, col = drv)) +
  geom_point() +
  geom_smooth(method = "lm") +
  stat_regline_equation(aes(label = paste(..eq.label..,
                                          ..rr.label..,
                                          sep = "~~~"),
                            group = drv,
                            col = drv),
                        label.x = 3,
                        label.y = c(26, 28, 30)
  )


mpg %>% 
  ggscatter("displ", "cty") +
  stat_regline_equation(formula = y ~ x,
                        aes(label = paste(..eq.label..,
                                          ..rr.label..,
                                          sep = "~~~")),
                        label.x = 3, 
                        label.y = 30)







