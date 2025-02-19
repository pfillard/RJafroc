% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Compare3ProperRocFits.R
\name{Compare3ProperRocFits}
\alias{Compare3ProperRocFits}
\title{Compare three proper-ROC curve fitting models}
\usage{
Compare3ProperRocFits(startIndx = 1, endIndx = 14, showPlot = FALSE,
  saveProprocLrcFile = FALSE, reAnalyze = FALSE)
}
\arguments{
\item{startIndx}{An integer in the range 1 to 14.}

\item{endIndx}{An integer in the range 1 to 14, greater than or equal 
to \code{startIndx}.}

\item{showPlot}{If \code{TRUE} the three plots are shown along with 95 
percent confidence intervals on the lowest and uppermost operating 
points. The default is \code{FALSE}.}

\item{saveProprocLrcFile}{If \code{TRUE} the binned datasets are saved 
for subsequent analysis using other ROC software, e.g., Windows 
DBM-MRMC. The default is \code{FALSE}.}

\item{reAnalyze}{If \code{TRUE} the data is reanalyzed. The default 
is \code{FALSE} in which case the previously saved results are used.}
}
\value{
The returned value is a list of 2:
   \code{allDatasetsResults} containing the fitting results and 
   \code{allBinnedDatasets} containing the binned datasets used in the fitting.
   See details.
}
\description{
Applies the Radiological Search Model (RSM) and the 
   Contaminated Binormal Model (CBM) ROC-curve fitting methods to 14 
   datasets and compares the fits to Proper ROC (PROPROC) 
   fits obtained using Windows software downloaded from the Univ. of 
   Iowa ROC website ca. June 2017.
}
\details{
allDatasetsResults is a list-array of length 
   (\code{endIndx} - \code{startIndx} + 1), where each element of the list-array 
   is a list with 10 elements. 
   
\itemize{
\item{\code{allDatasetsResults[[1]][[1]]}}{parameters of treatment 1 reader 1 in dataset \code{startIndx}}
\item{\code{allDatasetsResults[[1]][[2]]}}{parameters of treatment 1 reader 2 in dataset \code{startIndx}}
\item{\code{allDatasetsResults[[1]][[IJ]]}}{parameters of treatment \code{I} reader \code{J} in dataset \code{startIndx}}
\item{\code{allDatasetsResults[[2]][[1]]}}{parameters of treatment 1 reader 1 in dataset \code{startIndx+1}}
\item{\code{allDatasetsResults[[2]][[2]]}}{parameters of treatment 1 reader 2 in dataset \code{startIndx+1}}
\item{\code{allDatasetsResults[[2]][[IJ]]}}{parameters of treatment \code{I} reader \code{J} in dataset \code{startIndx+1}}
\item{\code{allBinnedDatasets[[1]]}}{binned ROC dataset corresponding to dataset \code{startIndx}}
\item{\code{allDatasetsResults[[2]][[IJ]]}}{binned ROC dataset corresponding to dataset  \code{startIndx+1}}
}
   
A specific member, e.g., \code{allDatasetsResults[[1]][[1]]}, has the following structure:   
\itemize{
\item{\code{retRsm}}{ The RSM parameters following the output structure of \code{\link{FitRsmRoc}}}
\item{\code{retCbm}}{ The CBM parameters following the output structure of \code{\link{FitCbmRoc}}}
\item{\code{lesDistr}}{ The lesion distribution matrix}
\item{\code{c1}}{ The \code{c}-parameter of PROPROC}
\item{\code{da}}{ The \code{d_sub_a} parameter of PROPROC}
\item{\code{aucProp}}{ The \code{PROPROC} AUC}
\item{\code{I}}{ The number of treatments}
\item{\code{J}}{ The number of readers}
\item{\code{K1}}{ The number of non-diseased cases}
\item{\code{K2}}{ The number of diseased cases}
}


The PROPROC parameters were obtained by running Windows software OR 
   DBM-MRMC 2.50 (Sept. 04, 2014, Build 4) with \strong{PROPROC} and 
   \strong{area} selected. The \code{RSM} and \code{CBM} fits are implemented
   in this package. Chapter 19 of the author's book has further details. 
   If \code{saveProprocLrcFile} 
   is \code{TRUE}, the \code{.lrc} files will be written to the \code{inst-MRMCRuns}
   directory, to appropriate subdirectory, \strong{overwriting} any existing files.
}
\examples{
ret <- Compare3ProperRocFits(1,1) # analyze first two datasets

\dontrun{
## takes longer than 5 sec on OSX
ret <- Compare3ProperRocFits(1,2,reAnalyze = TRUE) # analyze first two datasets
x <- ret$allDatasetsResults
str(x[[1]][[1]]) # parameters for dataset 1 trt 1 and rdr 1
str(x[[1]][[2]]) # parameters for dataset 1 trt 1 and rdr 2
str(x[[1]][[10]])# parameters for dataset 1 trt 2 and rdr 5
str(x[[2]][[1]]) # parameters for dataset 2 trt 1 and rdr 1
str(x[[2]][[2]]) # parameters for dataset 2 trt 1 and rdr 2
str(x[[2]][[10]])# parameters for dataset 2 trt 2 and rdr 5
}

\dontrun{ 
## these examples will cause errors; 
##these are intended to illustrate the structure of the functions return object
str(x[[1]][[11]])# error
str(x[[3]][[1]]) # error
}


}
\references{
Chakraborty DP (2017) \emph{Observer Performance Methods for Diagnostic Imaging - Foundations, 
Modeling, and Applications with R-Based Examples}, CRC Press, Boca Raton, FL. 
\url{https://www.crcpress.com/Observer-Performance-Methods-for-Diagnostic-Imaging-Foundations-Modeling/Chakraborty/p/book/9781482214840}

Metz CE, Pan X 1999 Proper Binormal ROC Curves: Theory and Maximum-Likelihood Estimation. 
J Math Psychol. \bold{43},(1):1--33.

Dorfman DD, Berbaum KS, 2000 A contaminated binormal model for ROC data: Part II. A formal model 
Acad Radiol \bold{7}, 427--437.
}
