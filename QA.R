library(tidyverse)
data(mpg)

mpg %>% 
  ggplot(aes(cty, fill = drv)) +
  geom_histogram(binwidth = 2, 
                 color = "white",
                 alpha = 0.5) +
  facet_wrap(~class, ncol =2) +
  labs(title = "Histogram of city mileage by drive train",
       x = "City mileage",
       y = "Frequency") +
  scale_x_continuous(breaks = seq(9, 35, 2),
                     labels = seq(9, 35, 2)) +
  scale_fill_manual(values = c("4" = "blue", "f" = "pink", "r" = "green"),
                    name = "Drive Engine")


table(mpg$drv)


p1 <- mpg %>% 
  ggplot(aes(hwy))+
  geom_histogram(fill = "darkorchid1",
                 color = "black",
                 binwidth = 2)+
  stat_bin(aes(label = ifelse(after_stat(count) == 0,
                              "", after_stat(count))), 
           binwidth = 2, 
           geom = "text",
           vjust = -0.5)+
  scale_y_continuous(limits = c(0,60), 
                     breaks = seq(0,60,10))+
  scale_x_continuous(breaks = seq(12,44,2))

summary(mpg$hwy)


data()


mtcars

data(diamonds)
  