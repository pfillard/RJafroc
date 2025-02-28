## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(RJafroc)

## ------------------------------------------------------------------------
power <- SsPowerGivenJK(dataset02, 6, 251, method = "ORH", option = "RRRC")

## ------------------------------------------------------------------------
str(power)

## ------------------------------------------------------------------------
powTab <- SsPowerTable(dataset02, method = "ORH", option = "RRRC")

## ------------------------------------------------------------------------
powTab

## ------------------------------------------------------------------------
ncases <- SsSampleSizeKGivenJ(dataset02, J = 10, method = "ORH", option = "RRRC")

## ------------------------------------------------------------------------
str(ncases)

## ------------------------------------------------------------------------
ncases <- SsSampleSizeKGivenJ(dataset02, J = 10, method = "ORH", option = "FRRC")

## ------------------------------------------------------------------------
ncases <- SsSampleSizeKGivenJ(dataset02, J = 10, method = "ORH", option = "RRFC")

