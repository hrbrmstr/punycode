#' Test if domain is Punycode
#'
#' Given a vector of domains, test if the domain is Punycode encdoed
#'
#' @param domains character vector of domains
#' @return logical vector (\code{TRUE} if Punycode test passed)
#' @export
#' @examples
#' is_punycode("новый-год.com", "rudis.net",
#'             "xn----peurf0asz4dzaln0qm161er8pd.biz")
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
#' is_idna("новый-год.com", "rudis.net",
#'         "xn----peurf0asz4dzaln0qm161er8pd.biz")
is_idna <- function(domains) {
  !is.na(str_locate(domains, "[^[:ascii:]]")[,"start"])
}
