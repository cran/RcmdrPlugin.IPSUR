\name{numSummaryIPSUR}
\alias{numSummaryIPSUR}
\alias{print.numSummaryIPSUR}

\title{Mean, Standard Deviation, Skewness, Kurtosis, and Quantiles for Numeric Variables}
\description{
\code{numSummary} creates neatly formatted tables of means, standard deviations, skewness, kurtosis, and quantiles of numeric variables.  Note that the \code{e1071} package must be installed to compute skewness or kurtosis.
}
\usage{
numSummaryIPSUR(data, statistics=c("mean", "sd", "skewness", "kurtosis","quantiles"), 
    quantiles=c(0, .25, .5, .75, 1), groups)
    
\method{print}{numSummaryIPSUR}(x, ...)
}

\arguments{
  \item{data}{a numeric vector, matrix, or data frame.}
  \item{statistics}{any of \code{"mean"}, \code{"sd"}, \code{"skewness"}, \code{"kurtosis"},or \code{"quantiles"}, 
    defaulting to the first four.}
  \item{quantiles}{quantiles to report; default is \code{c(0, 0.25, 0.5, 0.75, 1)}.}
  \item{groups}{optional variable, typically a factor, to be used to partition the data.}
  \item{x}{object of class \code{"numSummaryIPSUR"} to print.}
  \item{\dots}{arguments to pass down from the print method.}
}

\value{
\code{numSummaryIPSUR} returns an object of class \code{"numSummaryIPSUR"} containing the table of 
statistics to be reported along with information on missing data, if there are any.
}

\author{John Fox \email{jfox@mcmaster.ca}, with skewness and kurtosis added by G. Jay Kerns \email{gkerns@ysu.edu}}


\seealso{\code{\link[base]{mean}}, \code{\link[stats]{sd}}, \code{\link[e1071]{skewness}}, \code{\link[e1071]{kurtosis}}, \code{\link[stats]{quantile}}.}


\keyword{misc}

