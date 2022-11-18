# Install packages for specific functions

install.packages('dplyr')
install.packages('ggplot2')
library(dplyr)
library(ggplot2)

# INTRO TO THE LANGUAGE

# Variable assignment
x <- 3
y <- 2

# Basic mathematical operations
z <- x + y  # add x to y and assign it to z
print(x+y)  # Calculate the sum
print(z)    # print z
print(x^y)  # x to the power of y

# Load Data
df <- read.csv("https://raw.githubusercontent.com/artkochnev/jvi_crisis_course/main/data.csv")
head(df, 10)  # check the data
summary(df)

# DESCRIPTIVE ANALYSIS

# Get some description
summary(df$v_rs_cpi)

# Histogram plots
plot <- qplot(v_rs_cpi, data = df, geom = "histogram")  #  Plot the histogram
plot
plot <- qplot(v_rs_cpi, data = df, geom = "density")
plot

# Scatterplot
plot <- qplot(lag(d_wd_oil, 1), d_rs_cpi, data = df)
plot <- plot + geom_smooth(method = "lm") + ylim(0, 0.2)
plot

# Model of CPI and OIL price surprise
model <- lm(d_rs_cpi~lag(d_wd_oil, 1), data = df)
summary(model)

# Same model but controlling for the lagged CPI
model <- lm(d_rs_cpi~lag(d_rs_cpi,1) + lag(d_wd_oil, 1), data = df)
summary(model)

# Make your own model (add more variables, compare the results, discuss)
