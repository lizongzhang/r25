# 安装nycflights13包
install.packages("nycflights13")

# 加载nycflights13包
library(nycflights13)

# 查看flights数据集
head(flights)

library(tidyverse)

data(f)

view(flights)


# 确保已经安装并加载了nycflights13包
if (!require(nycflights13)) install.packages("nycflights13")
library(nycflights13)

# 查看flights数据集中前几行的dest列
head(flights$dest)

# 使用airports数据集来匹配dest代码，并获取机场名称
library(dplyr)
flights %>%
  select(dest) %>%
  distinct() %>%
  left_join(airports, by = c("dest" = "faa")) %>%
  select(dest, name)

summary(flights$distance)

library(nycflights13)
data(airports)
# 从flights数据集中提取唯一的目的地机场代码
unique_dest <- unique(flights$dest)

# 使用这些代码从airports数据集中提取相应的机场信息
airport_info <- airports %>%
  filter(faa %in% unique_dest) %>%
  select(faa, name, city, state, country)

# 查看结果
head(airport_info)

airports %>%
  select(name, tzone) %>% 
  distinct()

flights %>% 
  summarytools::dfSummary() %>% 
  summarytools::stview()


# dlookr ------------------------------------------------------------------

# 安装dlookr包
if (!require(dlookr)) install.packages("dlookr")
library(dlookr)
library(flextable)
library(tidyverse)

# 使用dlookr包中的数据查看函数
dlookr::data_view(flights)

diagnose(flights) %>% flextable::flextable()

diagnose_numeric(flights) %>% flextable::flextable()

diagnose_category(flights) %>% flextable::flextable()


install.packages("nycflights13")
install.packages("dlookr")
install.packages("flextable")
install.packages("psych")


#习题2.2
flights %>%
  group_by(hour) %>%
  summarise(arr_delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(arr_delay)

arrange(flights, desc(distance))

#The longest flight is HA 51, JFK to HNL, which is 4,983 miles.

arrange(flights, distance)


# 加载必要的包
library(ggplot2)
library(nycflights13)
library(dplyr)











