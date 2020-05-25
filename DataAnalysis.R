library(readr)
library(dplyr)
library(readr)

X104MonthSalary <- read_csv("C:/Users/asus/Desktop/Bigdatahw1/a17000000j-020066-mah.csv")
X107MonthSalary <- read_csv("C:/Users/asus/Desktop/Bigdatahw1/107MonthSalary.csv")

View(X104MonthSalary)
View(X107MonthSalary)

X104MonthSalary$大職業別<-
  gsub("、","_",X104MonthSalary$大職業別)
X107MonthSalary$大職業別<-
  gsub("、","_",X107MonthSalary$大職業別)

X104107MonthSalary<-inner_join(X104MonthSalary,X107MonthSalary ,by="大職業別")

View(X104107MonthSalary)
X104107MonthSalary$`大學-薪資.x`<-gsub("-",NA,X104107MonthSalary$`大學-薪資.x`)
X104107MonthSalary$`大學-薪資.y`<-gsub("-",NA,X104107MonthSalary$`大學-薪資.y`)

X104107MonthSalary$`大學-薪資.x`<-as.numeric(X104107MonthSalary$`大學-薪資.x`)
X104107MonthSalary$`大學-薪資.y`<-as.numeric(X104107MonthSalary$`大學-薪資.y`)

higher107<-filter(X104107MonthSalary,`大學-薪資.y`>`大學-薪資.x`)
