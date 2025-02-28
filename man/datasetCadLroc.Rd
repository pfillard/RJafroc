% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datasets.R
\docType{data}
\name{datasetCadLroc}
\alias{datasetCadLroc}
\title{Nico Karssemeijer LROC dataset (CAD vs. radiologists)}
\format{A list with 9 elements:
\itemize{
\item{\code{NL}}{ Ratings array [1, 1:10, 1:200, 1], of false positives, FPs}
\item{\code{LLCl}}{ Ratings array [1, 1:10, 1:80, 1], of true positives with correct localization, TPCls}
\item{\code{LLIl}}{ Ratings array [1, 1:10, 1:80, 1], of true positives with incorrect localization, TPIls}
\item{\code{lesionNum}}{ array [1:80], number of lesions per diseased case, all set to 1}
\item{\code{lesionID}}{ array [1:80, 1], labels of lesions on diseased cases, all set to 1}
\item{\code{lesionWeight}}{ array [1:80, 1], weights (or clinical importance) of lesions, all set to 1}
\item{\code{dataType}}{ "LROC", the data type}
\item{\code{modalityID}}{ [1:2] "0" "1", treatment labels}
\item{\code{readerID}}{ [1:10] "1" "2" ..., reader labels}
}}
\usage{
datasetCadLroc
}
\description{
This is the actual LROC data corresponding to \code{dataset09}, which was the inferred
ROC data. Note that the \code{LL} field is split into two, \code{LLCl}, representing true 
positives where the lesions were correctly localized, and \code{LLIl}, representing true 
positives where the lesions were incorrectly localized. The first reader is CAD
and the remaining readers are radiologists. The function 
\code{\link{StSignificanceTestingSingleFixedFactor}} analyzes such datasets.
}
\examples{
str(datasetCadLroc)


}
\references{
Hupse R  et al. Standalone computer-aided detection compared to radiologists' 
performance for the detection of mammographic masses. Eur Radiol. 2013;23(1):93-100.
}
\keyword{datasets}
