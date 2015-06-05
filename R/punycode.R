#' Test if domain is Punycode
#'
#' Given a vector of domains, test if the domain is Punycode encdoed
#'
#' @param domains character vector of domains
#' @return logical vector (\code{TRUE} if Punycode test passed)
#' @export
#' @examples
#' \dontrun{
#' # See the vignette since character set problems prevent clean latex
#' # function example builds
#' vignette("introduction_to_punycode")
#' }
is_punycode <- function(domains) {
  !is.na(str_locate(domains, "(?i)^xn--")[,"start"])
}


#' Test if domain is IDNA encoded
#'
#' Given a vector of domains, test if the domain is IDNA encdoed
#'
#' @param domains character vector of domains
#' @return logical vector (\code{TRUE} if IDNA test passed)
#' @export
#' @examples
#' \dontrun{
#' # See the vignette since character set problems prevent clean latex
#' # function example builds
#' vignette("introduction_to_punycode")
#' }
is_idna <- function(domains) {
  !is.na(str_locate(domains, "[^[:ascii:]]")[,"start"])
}
