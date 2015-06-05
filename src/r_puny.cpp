#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <stringprep.h>
#include <idna.h>
#include <tld.h>

#include <Rcpp.h>
using namespace Rcpp;

//' @title Encode Punycode domains to IDNA
//' @description Converts Punycode domains to IDNA.
//'
//' @param domains character vector of IDNA domains
//'
//' @return a character vector of IDNA domains
//'
//' @note If there are any issues during the conversion, \code{"Invalid"} will
//'       be the value returned.
//'
//' @seealso \url{http://www.faqs.org/rfcs/rfc3492.html} and
//'     \url{http://www.faqs.org/rfcs/rfc3490.html} and
//'     \url{http://www.gnu.org/software/libidn/}
//'
//' @export
//' @examples
//' \dontrun{
//' # See the vignette since character set problems prevent clean latex
//' # function example builds
//' vignette("introduction_to_punycode")
//' }
//[[Rcpp::export]]
std::vector < std::string > puny_encode(CharacterVector domains) {

  unsigned int input_size = domains.size();
  std::vector < std::string > output(input_size);

  char *p;
  int rc;

  for (unsigned int i = 0; i < input_size; i++) {

    rc = idna_to_unicode_lzlz (domains[i], &p, 0);

    printf("%d", rc);

    if (rc != IDNA_SUCCESS) {
      output[i] = "Invalid";
    } else {
      output[i] = std::string(p);
    }

    free(p);

  }

  return output;

}


//' @title Decode IDNA domains to Punycode
//' @description Converts IDNA domains to Punycode
//'
//' @param domains character vector of IDNA domains
//'
//' @return a character vector of Punycode domains
//'
//' @note If there are any issues during the conversion, \code{"Invalid"} will
//'       be the value returned.
//'
//' @seealso \url{http://www.faqs.org/rfcs/rfc3492.html} and
//'     \url{http://www.faqs.org/rfcs/rfc3490.html} and
//'     \url{http://www.gnu.org/software/libidn/}
//'
//' @export
//' @examples
//' \dontrun{
//' # See the vignette since character set problems prevent clean latex
//' # function example builds
//' vignette("introduction_to_punycode")
//' }
//[[Rcpp::export]]
std::vector < std::string > puny_decode(CharacterVector domains) {

  unsigned int input_size = domains.size();
  std::vector < std::string > output(input_size);

  char *p;
  int rc;

  for (unsigned int i = 0; i < input_size; i++) {

    rc = idna_to_ascii_lz(domains[i], &p, 0);

    if (rc != IDNA_SUCCESS) {
      output[i] = "Invalid";
    } else {
      output[i] = std::string(p);
    }

    free(p);

  }

  return output;

}

//' @title Check domains for validity
//' @description Check international domain names for charset validity
//'
//' @param domains character vector of domains
//'
//' @return a logical vector
//'
//' @seealso \url{http://www.faqs.org/rfcs/rfc3492.html} and
//'     \url{http://www.faqs.org/rfcs/rfc3490.html} and
//'     \url{http://www.gnu.org/software/libidn/}
//'
//' @export
//' @examples
//' \dontrun{
//' # See the vignette since character set problems prevent clean latex
//' # function example builds
//' vignette("introduction_to_punycode")
//' }
//[[Rcpp::export]]
std::vector < bool > puny_tld_check(CharacterVector domains) {

  unsigned int input_size = domains.size();
  std::vector < bool > output(input_size);

  char *p;
  int rc;
  uint32_t *r;
  size_t errpos;

  for (unsigned int i = 0; i < input_size; i++) {

    // if there are any basic conversion errors before the tld check
    // that means there is a problem with the data and that it should
    // be considered invalid. also, if there are any other return codes
    // from the tld check except for TLD_SUCCESS, that means the data
    // is invalid as well.

    rc = idna_to_ascii_8z (domains[i], &p, 0);

    if (rc != IDNA_SUCCESS) {
      output[i] = false;
    } else {
      rc = idna_to_unicode_8z4z (p, &r, 0);
      free(p);
      if (rc != IDNA_SUCCESS) {
        output[i] = false;
      } else {
        rc = tld_check_4z (r, &errpos, NULL);
        free(r);
        output[i] = (rc == TLD_SUCCESS);
      }
    }

  }

  return output;

}
