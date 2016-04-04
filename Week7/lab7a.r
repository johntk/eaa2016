#Assign the data into a vector in R
pd<-c(55,56,98,100,15,12,33,45,32,67,82,19,25)

cpuMax<-100

#CPU idle level% usage
cpuBusy<-(cpuMax-cpu)

#Plot the data
plot(cpubusy,type="l",main="CPU busy time", xlab="Time", ylab="% busy")


#Print the summary statistics 
print(summary(pd))

#Compute the min and max of the data            
print(max(pd))

print(min(pd))

stats<-(mean(pd),min(pd),max(pd))

#Plot the mean, min and max of the data
plot(stats)


#Plot a model to forecast the trend
x<-c(rep(1:length(cpuBusy)))
y<-lm(cpuBusy ~ x)
abline(y, col="green")
