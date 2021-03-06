#' Encode, Decode and Validate International Domain Names
#'
#' Punycode uses the GNU libidn \url{http://www.gnu.org/software/libidn/}
#' library and provides functions to encode, decode & validate Punycode and
#' Internationalizing Domain Names in Applications (IDNA) domains.
#'
#' Punycode is a simple and efficient transfer encoding syntax designed for use
#' with Internationalized Domain Names in Applications. It uniquely and
#' reversibly transforms a Unicode string into an ASCII string. ASCII
#' characters in the Unicode string are represented literally, and non-ASCII
#' characters are represented by ASCII characters that are allowed in host
#' name labels (letters, digits, and hyphens).
#'
#' Until now, there has been no standard method for domain names to use
#' characters outside the ASCII repertoire. The IDNA document defines
#' internationalized domain names (IDNs) and a mechanism called IDNA for
#' handling them in a standard fashion. IDNs use characters drawn from a
#' large repertoire (Unicode), but IDNA allows the non-ASCII characters to be
#' represented using only the ASCII characters already allowed in so-called
#' host names today. This backward-compatible representation is required in
#' existing protocols like DNS, so that IDNs can be introduced with no changes
#' to the existing infrastructure. IDNA is only meant for processing domain
#' names, not free text.
#'
#' Organizations that manage some Top Level Domains (TLDs) have published
#' tables with characters they accept within the domain. The reason may be to
#' reduce complexity that come from using the full Unicode range, and to
#' protect themselves from future (backwards incompatible) changes in the
#' IDN or Unicode specifications. Libidn (and, hence, this package) implements
#' an infrastructure for defining and checking strings against such tables.
#'
#' @name punycode
#' @docType package
#' @author Bob Rudis (@@hrbrmstr)
#' @importFrom Rcpp evalCpp
#' @importFrom stringr str_locate
#' @useDynLib punycode
NULL
