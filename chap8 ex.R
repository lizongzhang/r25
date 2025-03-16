install.packages("BSDA")
library(BSDA)

install.packages("DescTools")
library(DescTools)

install.packages("ggstatsplot")
library(ggstatsplot)

install.packages("report")
library(report)

# 8.1 
x <- rep(4.484, 9)

library(BSDA)
z.test(x, mu = 4.55, sigma.x = 0.108)

z_stat <- (4.484-4.55)/(0.108/sqrt(9))
p_value <-  2*pnorm(z_stat)

# 8.2

# 8.3

# 8.4

x <- c(99.3, 98.7, 100.5, 101.2, 98.3, 99.7, 99.5, 102.1, 100.5)
t.test(x, mu = 100) %>% report()

gghistostats(
  data = x %>% as_tibble(), 
  x = value,
  test.value = 100,
  type = "parametric"
)

# 8.5
prop.test(6, 50, p =0.05,
          alternative = "greater",
          correct = FALSE)

z_stat <- (0.12-0.05)/sqrt(0.05*0.95/50)
z_stat^2

# 8.7

# 8.8
x <- c(85, 59, 66, 81, 35, 57, 55, 63, 66)

library(DescTools)
VarTest(x, alternative = "greater", 
        sigma.squared = 100)

# 8.9

z.test(rep(1070, 81), rep(1020, 64), 
       alternative = "two.sided", 
       sigma.x = 63,
       sigma.y = 57)

# 8.10

x <- c(31, 34, 29, 32, 35, 38, 34, 30, 29, 32, 31, 26)

y <- c(26, 24, 28, 29, 30, 29, 32, 26, 31, 29, 32, 28)

library(DescTools)
VarTest(x, y)

t.test(x, y, alternative = "greater", var.equal = TRUE)

library(ggstatsplot)

df <- data.frame(time = c(x, y),
                 method = c(rep("a", 12), rep("b", 12)))

ggbetweenstats(
  data = df, 
  x = method, 
  y = time, 
  type = "parametric", 
  var.equal = TRUE)

# e.g.8.15

library(readxl)

df <- read_excel("例8.15.xlsx")


t.test(df$训练前,
       df$训练后,
       mu = 8.5, 
       paired = TRUE,
       alternative = "greater") 

t_stat <- (9.85-8.5)/(2.199/sqrt(10))

fit <- data.frame(
          weight = c(df$训练前, df$训练后),
           group = c(rep("before", 10), 
                     rep("after", 10)))
 
library(ggstatsplot)
ggwithinstats(fit, 
               x = group,
               y = weight)
               
               
# 8.13

prop.test(x = c(104, 189), n = c(11000, 11000),
          alternative = "less", 
          correct = FALSE)


prop.test(x = c(76, 69), n = c(100, 100), 
          correct = FALSE)



