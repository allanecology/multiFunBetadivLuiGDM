% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multidiversity.R
\name{multidiv}
\alias{multidiv}
\title{Calculate multifunctionality}
\usage{
multidiv(
  x,
  threshold = FALSE,
  sc = "max",
  mx = 1,
  cent = FALSE,
  by = FALSE,
  weights = 1
)
}
\arguments{
\item{x}{Input data frame or matrix. Rows are different diversities/ functions for multifun/div calculation. Columns are
replicates, e.g. plots.}

\item{threshold}{can be a proportion of the maximum e.g. 0.5 or can be the median or mean. It can also 
be a vector of the same length as the number of diversities to allow different thresholds for different diversities.
threshold = FALSE calculates the mean of the scaled diversities or functions}

\item{sc}{scaling can be by any function specified in "sc", i.e. max, mean, sd etc., max is the default. If the maximum 
should be a mean of the top n values specify sc = "maxx", mx = n}

\item{mx}{only if sc = "maxx", when the maximum should be a mean of the top n values, mx = n.}

\item{cent}{centering by the mean is possible with cent = TRUE, to take z-scores of the diversities/processes, use sc="sd" and cent = TRUE}

\item{by}{specifies a vector of the same length as nrow(x) to be used to split the data and use different thresholds for the groups in "by"}

\item{weights}{allows different weightings for the different diversities/functions and should be a vector of the same length 
as the number of diversities/functions (shorter vectors will be recycled) to weight a diversity as 0 and drop it from the calculation, 
code the weight as "NA" 
the default is weights = 1: all diversities weighted the same}
}
\value{
matrix with 2 columns, the first column is the multidiversity/ -functionality of each plot, the second being the 
number of measured (non NA) functions per plot.
}
\description{
created by Eric Allan
}
\examples{
# create fantasy dataset with 3 functions f1, f2 and f3 and 30 plots.
set.seed(2)
fundataset <- data.table::data.table(f1 = runif(30, min=0, max=100), f2 = runif(30, min=0, max=1), f3 = runif(30, min=0, max=10))
# calculate multifunctionality of this dataset, being the proportion of functions per plot which exceed the threshold of 0.5
# of the mean of maximum 5 functions.
multidiv(fundataset, threshold = 0.5, sc = "maxx", mx = 5, cent=FALSE, weights = 1)

}
