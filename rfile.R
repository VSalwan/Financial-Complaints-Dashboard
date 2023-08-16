
#importing libary
library(dplyr)
library("tidyr")

#Reading file
setwd("C:/Users/VISHVAM SALWAN/Downloads/Finanace")
file <- read.csv("Financial Consumer Complaints.csv")
file


#Checking na file
colSums(is.na(file))


#Replacing NA values
Consumer.disputed. = complete.cases(file$Consumer.disputed.)
file$Consumer.disputed.[is.na(file$Consumer.disputed.)] <- "No"
colSums(is.na(file))
file <- file %>% fill(Consumer.consent.provided , .direction = 'down')
colSums(is.na(file))
head(file)



#Removing tags columns
file <- subset(file, select = -Tags)
head(file)

#Filling empty columns
file <- file %>% fill(Sub.product , .direction = 'down')

#Droping rows with no date
file<-file %>% drop_na(Date.Sumbited)

#Filling empty columns
file <- file %>% fill(Sub.issue , .direction = 'up')

#Label Encoding
file$Submitted.via <- factor(file$Submitted.via)
file$Submitted.via<-as.numeric(file$Submitted.via)
head(file$Submitted.via)


#Final csv file
write.csv(file,"final.csv", row.names = TRUE)










