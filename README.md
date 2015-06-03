punycode is an R package to work with punycode (RFC3492) domains and relies on the [GNU libidn](http://www.gnu.org/software/libidn/) library for the hard parts.

The following functions are implemented:

-   `puny_encode` : Encode domains
-   `puny_deocde` : Decode domains
-   `puny_tld_validate` : Validate charset of domains (i.e. is allowed in TLD)

### Installation

``` r
devtools::install_github("hrbrmstr/punycode")
```

### Usage

``` r
library(punycode)

# current verison
packageVersion("punycode")
```

    ## [1] '0.1.0'

``` r
ascii_doms <- c("xn------qpeiobbci9acacaca2c8a6ie7b9agmy.net",
"xn----0mcgcx6kho30j.com",
"xn----9hciecaaawbbp1b1cd.net",
"xn----9sbmbaig5bd2adgo.com",
"xn----ctbeewwhe7i.com",
"xn----ieuycya4cyb1b7jwa4fc8h4718bnq8c.com",
"xn----ny6a58fr8c8rtpsucir8k1bo62a.net",
"xn----peurf0asz4dzaln0qm161er8pd.biz",
"xn----twfb7ei8dwjzbf9dg.com",
"xn----ymcabp2br3mk93k.com")

intnl_doms <- c("ثبت-دومین.com",
"טיול-לפיליפינים.net",
"бизнес-тренер.com",
"новый-год.com",
"東京ライブ-バルーンスタンド.com",
"看護師高収入-求人.net",
"ユベラ-贅沢ポリフェノール.biz",
"เด็ก-ภูเก็ต.com",
"ایران-هاست.com")


for_valid <- c("gr€€n.no", "זגורי-אימפריה-לצפייה-ישירה.net", "ثبت-دومین.com",
"טיול-לפיליפינים.net", "xn------qpeiobbci9acacaca2c8a6ie7b9agmy.net", "xn----0mcgcx6kho30j.com",
"xn----9hciecaaawbbp1b1cd.net", "rudis.net")

puny_encode(ascii_doms)
```

    ##  [1] "זגורי-אימפריה-לצפייה-ישירה.net"  "ثبت-دومین.com"                   "טיול-לפיליפינים.net"            
    ##  [4] "бизнес-тренер.com"               "новый-год.com"                   "東京ライブ-バルーンスタンド.com"
    ##  [7] "看護師高収入-求人.net"           "ユベラ-贅沢ポリフェノール.biz"   "เด็ก-ภูเก็ต.com"                      
    ## [10] "ایران-هاست.com"

``` r
puny_decode(intnl_doms)
```

    ## [1] "xn----0mcgcx6kho30j.com"                   "xn----9hciecaaawbbp1b1cd.net"             
    ## [3] "xn----9sbmbaig5bd2adgo.com"                "xn----ctbeewwhe7i.com"                    
    ## [5] "xn----ieuycya4cyb1b7jwa4fc8h4718bnq8c.com" "xn----ny6a58fr8c8rtpsucir8k1bo62a.net"    
    ## [7] "xn----peurf0asz4dzaln0qm161er8pd.biz"      "xn----twfb7ei8dwjzbf9dg.com"              
    ## [9] "xn----ymcabp2br3mk93k.com"

``` r
puny_tld_check(for_valid)
```

    ## [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE

### Test Results

``` r
library(punycode)
library(testthat)

date()
```

    ## [1] "Wed Jun  3 14:47:31 2015"

``` r
test_dir("tests/")
```

    ## encoding : ..
    ## decoding : ..
    ## validation : .
