setwd("G:/Mi unidad/Ingeniaritza Informatikoa/4. Maila/2. Lauhilekoa/BH/Proiektua - Community Detection/bayesian_analysis")

## load full set of data
results_ILS<-read.csv(file="../output/results_ILS.csv",header=TRUE,sep=",",stringsAsFactor=FALSE)
results_GA_EDA<-read.csv(file="../output/results_GA_EDA.csv",header=TRUE,sep=",",stringsAsFactor=FALSE)
results<-rbind(results_ILS,results_GA_EDA)
results_median<-aggregate(results[,3],list(results$com_count,results$algorithm),median)
colnames(results_median)<-c("com_count","algorithm","fitness")

results_median_ILS<-results_median[results_median$algorithm=="ILS",]
results_median_GA_EDA<-results_median[results_median$algorithm=="GA_EDA",]

source("bayesian.R")
source("plotting.R")
library("ggplot2")
library(latex2exp)
test.results <- bSignedRankTest(x=results_median_ILS$fitness, y=results_median_GA_EDA$fitness, rope=c(-0.005, 0.005))
test.results$posterior.probabilities

p1<-plotSimplex(test.results, plot.density=TRUE, A="ILS",B="GA-EDA", plot.points=TRUE, posterior.label=FALSE, alpha=0.5, point.size=1, font.size = 5)
ggsave("Simplex_Community.png",p1, width = 125, height = 125, dpi = 300, units = "mm", device='png')
colMeans(test.results$posterior)
plot(density(test.results$posterior$Right),xlim=c(0,1), ylim=c(0,40))
lines(density(test.results$posterior$Left))
lines(density(test.results$posterior$Rope))
