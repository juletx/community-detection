setwd("G:/Mi unidad/Ingeniaritza Informatikoa/4. Maila/2. Lauhilekoa/BH/Proiektua - Community Detection/bayesian_analysis")

## load full set of data
results_bks<-read.csv(file="best_known_results.csv",header=TRUE,sep=";",stringsAsFactor=FALSE)
results<-read.csv(file="results_1000n2_gradient.csv",header=TRUE,sep=";",stringsAsFactor=FALSE)
pleda<-read.csv(file="results_1000n2_PLEDA.csv",header=TRUE,sep=";",stringsAsFactor=FALSE)
results<-rbind(results,pleda)
results_median<-aggregate(results[,4],list(results$Instance,results$Algorithm),median)
colnames(results_median)<-c("Instance","Algorithm","Fitness")

Normalized= seq(1,length(results_median$Instance),1)
results_median = cbind(results_median,Normalized)

#Performance results comparison
for (i in 1:length(results_median$Instance)) 
{
  best_known<-results_bks[results_bks$Instance==results_median$Instance[i],]
  best_fit<-as.numeric(as.character(best_known$Result))
  fitness<-results_median[i,]$Fitness
  results_median[i,]$Normalized<-abs(fitness-best_fit)/best_fit
}

results_median_PLEDA<-results_median[results_median$Algorithm=="PLEDA",]
results_median_Gradient<-results_median[results_median$Algorithm!="PLEDA",]

source("bayesian.R")
source("plotting.R")
library("ggplot2")
library(latex2exp)
test.results <- bSignedRankTest(x=results_median_PLEDA$Normalized, y=results_median_Gradient$Normalized, rope=c(-0.0001, 0.0001))
test.results$posterior.probabilities

p1<-plotSimplex(test.results, plot.density=TRUE, A=TeX('PL-GS($\\lambda =100$, $\\alpha =0.1$)'),B="PL-EDA", plot.points=TRUE, posterior.label=FALSE, alpha=0.5, point.size=1,font.size = 5)
ggsave("Simplex.png",p1, width = 125, height = 125, dpi = 300, units = "mm", device='png')
colMeans(test.results$posterior)
plot(density(test.results$posterior$Right),xlim=c(0,1), ylim=c(0,40))
lines(density(test.results$posterior$Left))
lines(density(test.results$posterior$Rope))
