% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SsSampleSizeKGivenJ.R
\name{SsSampleSizeKGivenJ}
\alias{SsSampleSizeKGivenJ}
\title{Number of cases, for specified number of readers, to achieve desired power}
\usage{
SsSampleSizeKGivenJ(dataset, J, alpha = 0.05, effectSize = NULL,
  desiredPower = 0.8, option = "ALL", method = "DBMH", ...)
}
\arguments{
\item{dataset}{The \bold{pilot} ROC dataset to be used to extrapolate to the \bold{pivotal} study. If 
missing, then variance components and effectSize must be passed as additional parameters.}

\item{J}{The number of readers in the pivotal study.}

\item{alpha}{The significance level of the study, default is 0.05.}

\item{effectSize}{The effect size to be used in the pivotal study, default value is \code{NULL}.}

\item{desiredPower}{The desired statistical power, default is 0.8.}

\item{option}{Desired generalization, "RRRC", "FRRC", "RRFC" or "ALL" (the default).}

\item{method}{"DBMH" (default) or "ORH".}

\item{...}{Other parameters, OR or DBM variance components, passed internally, see details}
}
\value{
A list of two elements:

\item{K}{The minimum number of cases K in the pivotal study 
   to just achieve the desired statistical power.}

\item{power}{The predicted statistical power.}
}
\description{
Number of cases to achieve the desired power, for 
  specified number of readers J, and specified DBMH or ORH analysis method
}
\details{
Other parameters \code{...} are reserved for internal use. The default \code{effectSize}
    uses the observed effect size in the pilot study. A numeric value over-rides the default value.
}
\note{
The procedure is valid for ROC studies only; for FROC studies see Online Appendix Chapter 19.
}
\examples{
## An example using the DBM method
SsSampleSizeKGivenJ(dataset02, J = 6, method = "DBMH")

## An example using the OR method
SsSampleSizeKGivenJ(dataset02, J = 6, method = "ORH")


\donttest{ 
for (J in 6:10) {
 ret <- SsSampleSizeKGivenJ(dataset02, J = J, option = "RRRC") 
 message("# of readers = ", J, " estimated # of cases = ", ret$K, ", predicted power = ",
    signif(ret$powerRRRC,3), "\\n")
}
}

}
\references{
Hillis SL, Obuchowski NA, Berbaum KS (2011) Power Estimation for Multireader ROC Methods: 
An Updated and Unified Approach, Acad Radiol, 18, 129--142.

Hillis SL, Obuchowski NA, Schartz KM, Berbaum KS (2005) A comparison of the Dorfman-Berbaum-Metz 
and Obuchowski-Rockette methods for receiver operating characteristic (ROC) data, 
Statistics in Medicine, 24:10, 1579--607.
}
