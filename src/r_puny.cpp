#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <stringprep.h>
#include <idna.h>
#include <tld.h>

#include <Rcpp.h>
using namespace Rcpp;

//' @title Encode punycode domains to IDNA
//' @description Converts punycode domains to IDNA
//'
//' @param domains character vector of IDNA domains
//'
//' @return a character vector of IDNA domains
//'
//' @seealso \url{http://www.faqs.org/rfcs/rfc3492.html}
//'
//' @examples
//' puny_encode("xn------qpeiobbci9acacaca2c8a6ie7b9agmy.net")
//' @export
//[[Rcpp::export]]
std::vector < std::string > puny_encode(CharacterVector domains) {

  unsigned int input_size = domains.size();
  std::vector < std::string > output(input_size);

  char *p;
  int rc;

  for(unsigned int i = 0; i < input_size; i++) {

    rc = idna_to_unicode_lzlz (domains[i], &p, 0);

    if (rc != IDNA_SUCCESS) {
      output[i] = "Invalid";
    } else {
      output[i] = std::string(p);
    }

    free(p);

  }

  return output;

}


//' @title Decode IDNA domains to punycode
//' @description Converts IDNA domains to punycode
//'
//' @param domains character vector of IDNA domains
//'
//' @return a character vector of punycode domains
//'
//' @seealso \url{http://www.faqs.org/rfcs/rfc3492.html}
//'
//' @examples
//' puny_decode("новый-год.com")
//' @export
//[[Rcpp::export]]
std::vector < std::string > puny_decode(CharacterVector domains) {

  unsigned int input_size = domains.size();
  std::vector < std::string > output(input_size);

  char *p;
  int rc;

  for(unsigned int i = 0; i < input_size; i++) {

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
//' @seealso \url{http://www.faqs.org/rfcs/rfc3492.html}
//'
//' @examples
//' puny_tld_check("gr€€n.no")
//' @export
//[[Rcpp::export]]
std::vector < bool > puny_tld_check(CharacterVector domains) {

  unsigned int input_size = domains.size();
  std::vector < bool > output(input_size);

  char *p;
  int rc;
  uint32_t *r;
  size_t errpos;

  for(unsigned int i = 0; i < input_size; i++) {

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
