## ----setup, echo = FALSE, message=FALSE----------------------------------

library(knitr)

knitr::opts_chunk$set(echo = TRUE, 
                      warning = FALSE, 
                      message = FALSE, 
                      fig.width=7, fig.height=7)


## ----eval=FALSE----------------------------------------------------------
#  nCores <- detectCores() - coreOut
#  cl <- makeCluster(nCores)
#  registerDoParallel(cl)
#  repAnnual <- foreach(n = 1:nBoot,.packages=c('EGRETci')) %dopar% {
#     annualResults <- bootAnnual(eList,
#                                 blockLength,
#                                 startSeed = n)
#  }
#  stopCluster(cl)
#  

## ---- echo = FALSE-------------------------------------------------------
library(EGRET)
library(EGRETci)
eList <- Choptank_eList
pairResults2 <- readRDS("pairResults2.rds")


## ----setupData, eval=FALSE-----------------------------------------------
#  library(EGRET)
#  library(EGRETci)
#  eList <- Choptank_eList
#  pairResults2 <- runPairs(eList, year1 = 1985, year2 = 2010,
#                           windowSide = 7, flowBreak = TRUE,
#                           Q1EndDate = "1995-05-31", wall = TRUE,
#                           sample1EndDate = "1995-05-31",
#                           QStartDate = "1979-10-01",
#                           QEndDate = "2010-09-30",
#                           paStart = 4, paLong = 5)
#  

## ------------------------------------------------------------------------
bootPairOut2 <- runPairsBoot(eList, 
                             pairResults2, 
                             nBoot = 10) 

## ----eval=FALSE----------------------------------------------------------
#  plotHistogramTrend(eList, eBoot, caseSetUp = NA,
#                     flux = TRUE, xMin = NA, xMax = NA,
#                     xStep = NA, printTitle = TRUE,
#                     cex.main = 1.1, cex.axis = 1.1,
#                     cex.lab = 1.1, col.fill = "grey", ...)

## ---- echo = FALSE-------------------------------------------------------
bootPairOut2 <- readRDS("bootPairOut2.rds")

## ------------------------------------------------------------------------
plotHistogramTrend(eList,bootPairOut2, caseSetUp = NA)
plotHistogramTrend(eList,bootPairOut2, caseSetUp = NA, flux = FALSE)

## ----eval=FALSE----------------------------------------------------------
#  CIAnnualResults <- ciCalculations(eList,
#                                    startSeed = 494817,
#                                    verbose = TRUE, ...)

## ----setupSeries, eval=FALSE---------------------------------------------
#  eList <- Choptank_eList
#  eListOut <- runSeries(eList, windowSide = 7, verbose = FALSE)
#  CIAnnualResults <- ciCalculations(eListOut,
#                                    verbose = FALSE,
#                                    nBoot = 100,
#                                    blockLength = 200,
#                                    widthCI = 90)

## ---- echo = FALSE-------------------------------------------------------
CIAnnualResults <- readRDS("CIAnnualResults.rds")
eListOut <- readRDS("eListOutSeries.rds")

## ---- eval = FALSE-------------------------------------------------------
#  CIAnnualResults <- ciCalculations(eListOut,
#                                    verbose = FALSE,
#                                    nBoot = 100,
#                                    blockLength = 200,
#                                    widthCI = 90)

## ------------------------------------------------------------------------
plotConcHistBoot(eListOut, CIAnnualResults)
plotFluxHistBoot(eListOut, CIAnnualResults)

## ---- echo = TRUE, eval=FALSE--------------------------------------------
#  eList <- Choptank_eList
#  groupResults <- runGroups(eList,
#                            group1firstYear = 1995, group1lastYear = 2004,
#                            group2firstYear = 2005, group2lastYear = 2010,
#                            windowSide = 7, wall = TRUE,
#                            sample1EndDate = "2004-10-30",
#                            paStart = 4, paLong = 2, verbose = FALSE)
#  bootGroupsOut <- runGroupsBoot(eList, groupResults, nBoot = 100)
#  

## ---- eval = TRUE, echo=FALSE--------------------------------------------
groupResults <- readRDS("groupResults.rds")
bootGroupsOut <- readRDS("bootGroupsOut.rds")

## ----eval=FALSE----------------------------------------------------------
#  plotHistogramTrend(eList, eBoot, flux = TRUE,
#                           xMin = NA, xMax = NA, xStep = NA,
#                           printTitle = TRUE, cex.main = 1.1,
#                           cex.axis = 1.1, cex.lab = 1.1,
#                           col.fill = "grey", ...)

## ----eval=FALSE----------------------------------------------------------
#  plotHistogramTrend(eList, bootGroupsOut,
#                     xMin = -30, xMax = 40, xStep = 10)
#  
#  plotHistogramTrend(eList, bootGroupsOut,
#                     flux=FALSE, xMin = -30, xMax = 40, xStep = 10)

