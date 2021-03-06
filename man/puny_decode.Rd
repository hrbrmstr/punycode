% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{puny_decode}
\alias{puny_decode}
\title{Decode IDNA domains to Punycode}
\usage{
puny_decode(domains)
}
\arguments{
\item{domains}{character vector of IDNA domains}
}
\value{
a character vector of Punycode domains
}
\description{
Converts IDNA domains to Punycode
}
\note{
If there are any issues during the conversion, \code{"Invalid"} will
      be the value returned.
}
\examples{
\dontrun{
# See the vignette since character set problems prevent clean latex
# function example builds
vignette("introduction_to_punycode")
}
}
\seealso{
\url{http://www.faqs.org/rfcs/rfc3492.html} and
    \url{http://www.faqs.org/rfcs/rfc3490.html} and
    \url{http://www.gnu.org/software/libidn/}
}

