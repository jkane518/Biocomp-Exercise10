########Exercise 10#######
#11/22/21
#John Kane
rm(list=ls())
#1 Find some data on two variables that you would expect to be related to each other. 
#These data can come from your own research, your daily life, or the internet. 
#Enter those data into a text file or Excel and then save a text file, and write
#a script that loads this text file and produces a scatter plot of those two 
#variables that includes a trend line.

#This scatter plot looks at the relationship between temperature and snowfall over time.
#The file TempSnowfall.txt has 70 years of data comparing the lowest temperature each year
#and the most amount of snowfall in a single day.

TempSnow<-read.table("TempSnowfall.txt", header=TRUE, sep="\t")


ggplot(data=TempSnow, aes(x=Low_temperature,y=Snowfall))+
  geom_point()+
  theme_classic()+
  xlab("Low Temperature (ºF)")+
  ylab("Snowfall (in)")+
  stat_smooth(method="lm")



#2
#Write a script that generates two figures that sumamrize the data. First, show
#a barplot of the means of the four populations. Second, show a scatter plot of 
#all of the observations. 

data<-read.table("data.txt", header=TRUE, sep=",")

#Bar plot
ggplot(data, aes(x=region, y=observations))+
  stat_summary(geom = "bar", fun = "mean")+
  stat_summary(fun.data = mean_se,
               geom = "errorbar",
               width = 0.1)+
  ylab("Average Observations")+
  xlab("Region")+
  coord_cartesian(ylim=c(0,20))+
  theme_classic()


#Scatter plot
ggplot(data=data,
       aes(x = region, y = observations)) +
  geom_jitter() +
  xlab("Region") +
  ylab("Observations") +
  theme_classic()

####Do the bar and scatter plot tell you different stories? Why?

#A traditional scatter plot wouldn't have been the best choice because we have a discrete 
#variable. But using the geom_jitter, we are able to see the summary of all of the points
#within that sample, which allows us to see the total distribution of the data.
#We also could have used a violin or box plot to illustrate the same thing, 
#but the box plot would also show us a mean/median. 

#The bar graph only shows us the mean and standard error, but not all of the data for that category.
#The data in the north region is tightly represented around the mean whereas the east and west
#have much greater variation. Since the 4 means are relatively close together, 
#we don't see much difference in the 4 bars, but in the scatterplot, we see
#the differences in distribution between the regions.