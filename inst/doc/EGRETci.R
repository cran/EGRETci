## ----setup, include=FALSE---------------------------------
library(rmarkdown)
options(continue=" ")
options(width=60)
library(knitr)
library(EGRET)
library(EGRETci)

knitr::opts_chunk$set(
  echo = TRUE,
  eval = TRUE, # Change this later!
  message = FALSE,
  warning = FALSE,
  fig.width = 7, 
  fig.height = 4
) 


## ----eval=FALSE, echo=TRUE--------------------------------
# library(EGRET)
# library(EGRETci)
# eList <- Choptank_eList
# 
# year1 <- 1985
# year2 <- 2009
# 
# pairOut <- EGRET::runPairs(eList,
#                              year1, year2,
#                              windowSide = 7)
# 
# # For good analysis, set nBoot to about 100
# # For a quick check that things are working, set it much lower:
# boot_pair_out <- runPairsBoot(eList, pairOut, nBoot = 100)
# 

## ---------------------------------------------------------
library(EGRET)
library(EGRETci)
eList <- Choptank_eList
eList <- setPA(eList, paStart = 12, paLong = 4)
eList$INFO$windowY <- 10
eList$INFO$minNumObs <- 50

year1 <- 1990 
year2 <- 2011

pairOut <- EGRET::runPairs(eList,
                             year1, year2,
                             windowSide = 7)

boot_pair_out <- runPairsBoot(eList, pairOut, nBoot = 50)


## ----fig.height=6, fig.width=6----------------------------
library(EGRET)
library(EGRETci)

#Concentration an initial run:
plotHistogramTrend(eList = eList, eBoot = boot_pair_out,
                   xMin = -15, xMax = 35, xStep = 5)

#Flux an initial run:
plotHistogramTrend(eList = eList, eBoot = boot_pair_out,
                   xMin = -15, xMax = 35, xStep = 5,
                   flux = TRUE)


## ----histExampleCombo, fig.width=7, fig.height=4----------
par(mfrow=c(1,2))
#Concentration, presentation version:
plotHistogramTrend(eList = eList, eBoot = boot_pair_out,
                   xMin = -15, xMax = 35, xStep = 5,
                   flux = FALSE)

#Flux, presentation version:
plotHistogramTrend(eList = eList, eBoot = boot_pair_out,
                   xMin = -15, xMax = 35, xStep = 5,
                   flux = TRUE)
# To return to figures printing in 1 row, 1 columns:
par(mfrow=c(1,1))                   

## ----histExampleCombo2, fig.width=7, fig.height=10--------
par(mfrow=c(2,1))
#Concentration, presentation version:
plotHistogramTrend(eList = eList, eBoot = boot_pair_out,
                   xMin = -15, xMax = 35, xStep = 5,
                   flux = FALSE)

#Flux, presentation version:
plotHistogramTrend(eList = eList, eBoot = boot_pair_out,
                   xMin = -15, xMax = 35, xStep = 5,
                   flux = TRUE)
# To return to figures printing in 1 row, 1 columns:
par(mfrow=c(1,1))                   

## ----eval=FALSE, echo=TRUE--------------------------------
# eList <- modelEstimation(eList)

## ----eval=FALSE-------------------------------------------
# library(EGRET)
# library(EGRETci)
# 
# eList <- Choptank_eList
# 
# CIAnnualResults <- ciCalculations(eList)
# 
# save(eList,CIAnnualResults, file="CIAnnualResults.RData")

## ----eval=FALSE-------------------------------------------
# CIAnnualResults <- ciCalculations(eList, nBoot = 100, blockLength = 200, widthCI = 90)

## ----eval=FALSE-------------------------------------------
# library(foreach)
# library(doParallel)
# library(iterators)
# library(EGRET)
# library(EGRETci)
# 
# eList <- Choptank_eList
# eList <- modelEstimation(eList)
# 
# nBoot <- 100
# blockLength <- 200
# coreOut <- 1 #Number of cores to leave out of processing tasks
# 
# widthCI <- 90
# ciLower <- (50-(widthCI/2))/100
# ciUpper <- (50+(widthCI/2))/100
# probs <- c(ciLower,ciUpper)
# 
# nCores <- detectCores() - coreOut
# cl <- makeCluster(nCores)
# registerDoParallel(cl)
# repAnnual <- foreach(n = 1:nBoot,.packages=c('EGRETci')) %dopar% {
#    annualResults <- bootAnnual(eList,
#                                blockLength,
#                                startSeed = n)
# }
# stopCluster(cl)
# 
# # save(repAnnual, file="repAnnual.RData")
# 
# CIAnnualResults <- ciBands(eList, repAnnual, probs)
# save(eList,CIAnnualResults, file="CIAnnualResults.RData")
# 

## ----fig.height=5, fig.width=7----------------------------
eList <- Choptank_eList

CIAnnualResults <- Choptank_CIAnnualResults

plotConcHistBoot(eList, CIAnnualResults)

plotFluxHistBoot(eList, CIAnnualResults)


