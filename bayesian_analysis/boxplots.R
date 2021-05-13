
library(ggplot2)
library(gridExtra)
setwd("/Users/JosuC/Dropbox/EHU/Research/Supervision_Colaboration/Valentino/Gradient_search_in_PL/Experiments_workshop/comparison/")
results<-read.csv(file="results_1000n2_gradient.csv",header=TRUE,sep=";",stringsAsFactor=FALSE)
pleda<-read.csv(file="results_1000n2_PLEDA.csv",header=TRUE,sep=";",stringsAsFactor=FALSE)
results<-rbind(results,pleda)
#results<-results[results$Instance!="8",]
results_bks<-read.csv(file="best_known_results.csv",header=TRUE,sep=";",stringsAsFactor=FALSE)

Normalized= seq(1,length(results$Instance),1)
Size=seq(1,length(results$Instance),1)
results = cbind(results,Normalized)
results = cbind(results,Size)
#Performance results comparison
colnames(results)<-c("Instance","Repetition","Algorithm","Fitness","Time", "Normalized", "Size")
for (i in 1:length(results$Instance)) 
{
  best_known<-results_bks[results_bks$Instance==results$Instance[i],]
  best_fit<-as.numeric(as.character(best_known$Result))
  fitness<-results[i,]$Fitness
  results[i,]$Normalized<-abs(fitness-best_fit)/best_fit
  results[i,]$Size<-results_bks[results_bks$Instance==results$Instance[i],]$Size
}
results$Repetition<-as.integer(results$Repetition)
results$Size<-as.character(results$Size)


results[results$Algorithm!="PLEDA",]$Algorithm<-"PL-GS"
results[results$Algorithm=="PLEDA",]$Algorithm<-"PL-EDA"

p1<-ggplot(results,aes(x=Instance,y=Normalized,fill=Algorithm))+geom_boxplot()+ theme(axis.text.x = element_text(angle = 90))+ggtitle("Fitness PLEDA vs. GradientSearch (1000n^2evals)")
ggsave("PerformanceBoxPlot_PLEDAvsGradientAscent.png",p1, width = 200, height = 200, dpi = 300, units = "mm", device='png')


#Time comparison
p2<-ggplot(results,aes(x=Size,y=Time,fill=Algorithm))+geom_boxplot()+ theme_bw()+ theme(text = element_text(size=16),legend.position = c(.2, .95),
  legend.justification = c("right", "top"),
  legend.box.just = "right",
  legend.margin = margin(6, 6, 6, 6))+ggtitle("Time comparison. PL-GS vs. PL-EDA")+ylab("Time(s)")+xlab("Instance size")
ggsave("TimeBoxplots_PLEDAvsGradientAscent.png",p2, width = 230, height = 150, dpi = 300, units = "mm", device='png')



