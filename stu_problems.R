library(tidyverse)
data(mpg)

mpg %>% 
  ggplot(aes(hwy, fill = substr(trans,1,4)))+
  geom_histogram(breaks = seq(10,50,5)) +
  facet_wrap(~fl,ncol = 2) +
  scale_x_continuous(breaks = seq(10,50,5),
                     labels = seq(10,50,5)) +
  scale_fill_manual(values = c("auto" = "red",
                               "manu" = "blue"),
                    name = "transmission",
                    labels = c("auto" = "auto",
                               "manu" = "manual")) +
  theme_bw()


mpg %>% 
  ggplot(aes(hwy, fill = substr(trans,1,4)))+
  geom_histogram(breaks = seq(10,50,5)) +
  facet_wrap(~fl,ncol = 2) +
  scale_x_continuous(breaks = seq(10,50,5),
                     labels = seq(10,50,5)) +
  theme_bw()













  