library("ggplot2")

pd<-read.csv("full_data.csv")
pd<-pd[[!is.na(pd$education),]]

qplot(age,data = pd,fill=intent,binwidth=1,facets = .~race,
      ylab="U.S. Gun Deaths (2012-2014)")

qplot(age, intent, data = pd,facets=.~education,
      size=I(1/100),na.rm=TRUE)+geom_jitter(size=0.02)

qplot(age, data = pd,fill=sex,binwidth=1)

qplot(age,data = pd,fill=intent,
      na.rm=TRUE,binwidth=1, 
      ylab="U.S. Gun Deaths (2012-2014)")+
        facet_grid(education~race,margins=TRUE)


ggplot(pd[pd$race=="Black",],aes(age))+
        ylab("U.S. Gun Deaths (2012-2014)")+
        geom_histogram(aes(fill=intent),binwidth = 1,na.rm=TRUE)+
        facet_grid(education~sex,margins=TRUE)

ggplot(pd[pd$race=="White",],aes(age))+
        ylab("U.S. Gun Deaths (2012-2014)")+
        geom_histogram(aes(fill=intent),binwidth = 1,na.rm=TRUE)+
        facet_grid(education~sex,margins=TRUE)

ggplot(pd[pd$race=="White"|pd$race=="Black",],aes(age))+
        ylab("U.S. Gun Deaths (2012-2014)")+
        geom_histogram(aes(fill=intent),binwidth = 1,na.rm=TRUE)+
        facet_grid(education~race,margins=TRUE)