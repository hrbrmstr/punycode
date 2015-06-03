#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <stringprep.h>
#include <idna.h>

#include <Rcpp.h>
using namespace Rcpp;

//' @title Encode punycode domains to IDNA
//' @description Converts punycode domains to IDNA
//'
//' @param domains IDNA domains
//'
//' @return a vector of IDNA domains
//'
//' @seealso \url{http://www.faqs.org/rfcs/rfc3492.html}
//'
//' @examples
//' \dontrun{
//' }
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
//' @param domains IDNA domains
//'
//' @return a vector of punycode domains
//'
//' @seealso \url{http://www.faqs.org/rfcs/rfc3492.html}
//'
//' @examples
//' \dontrun{
//' }
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

