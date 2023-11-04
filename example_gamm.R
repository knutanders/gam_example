## This is an example to illustrate a question asked on the
## forum CrossValidated: 
## https://stats.stackexchange.com/questions/630188/estimated-means-for-groups-based-on-continous-predictor-in-gamm?noredirect=1#comment1176408_630188
## The data used in this exampel are not the actual data from the study. 

library(tidyverse)
library(mgcv)
read_rds("example.rds")
m1 <- gam(survival ~ s(age, bs="cc", k = 4) + 
            s(mother_id, bs="re") + s(litter_id, bs="re"),
          family=binomial, data=example, method = "ML")
summary(m1)
emmeans(m1, ~ s(age), type = "response", at = list(age = 1:6))

## In this case, individuals can only reproduce once a year 
## (i.e. at integer values of age). I want to present the 
## estimated probability of survival for age = 1, 
## mean estimated probability of survival for ages from 2 to 5, 
## and estimated probability of survival for age = 6. 