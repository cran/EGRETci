% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotCIs.R
\name{bootAnnual}
\alias{bootAnnual}
\title{Single confidence interval bootstrap run}
\usage{
bootAnnual(eList, blockLength = 200, startSeed = 494817, verbose = FALSE,
  jitterOn = FALSE, V = 0.2)
}
\arguments{
\item{eList}{named list with at least the Daily, Sample, and INFO dataframes. Created from the EGRET package, after running \code{\link[EGRET]{modelEstimation}}.}

\item{blockLength}{integer default value is 200.}

\item{startSeed}{setSeed value. Defaults to 494817. This is used to make repeatable output.}

\item{verbose}{logical specifying whether or not to display progress message.}

\item{jitterOn}{logical, if TRUE, adds "jitter" to the data in an attempt to avoid some numerical problems.  Default = FALSE.  See Details below.}

\item{V}{numeric a multiplier for addition of jitter to the data, default = 0.2.}
}
\description{
One bootstrap run used in calculating confidence interval bands.
}
\details{
In some situations numerical problems are encountered in the bootstrap process, resulting in highly unreasonable spikes in the confidence intervals.
The use of "jitter" can often prevent these problems, but should only be used when it is clearly needed.
It adds a small amount of random "jitter" to the explanatory variables of the WRTDS model.  The V parameter sets the scale of variation in the log discharge values.
The standard deviation of the added jitter is V * standard deviation of Log Q.
The default for V is 0.2.  Larger values should generally be avoided, and smaller values may be sufficient.
}
\examples{
library(EGRET)
eList <- Choptank_eList
\dontrun{
annualResults <- bootAnnual(eList)
}
}
