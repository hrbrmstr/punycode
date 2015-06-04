context("encoding")
test_that("we can encode domains", {

  expect_that(puny_encode("xn------qpeiobbci9acacaca2c8a6ie7b9agmy.net"), matches("זגורי-אימפריה-לצפייה-ישירה.n"))
  expect_that(puny_encode("rudis.net"), matches("rudis.net"))

})

context("decoding")
test_that("we can decode domains", {

  expect_that(puny_decode("도매cook.com"), matches("xn--cook-9k1q670a.com"))
  expect_that(puny_decode("rudis.net"), matches("rudis.net"))

})

context("validation")
test_that("we can validate domains", {

  expect_that(sum(puny_tld_check(c("gr€€n.no", "זגורי-אימפריה-לצפייה-ישירה.net", "ثبت-دومین.com",
"טיול-לפיליפינים.net", "xn------qpeiobbci9acacaca2c8a6ie7b9agmy.net", "xn----0mcgcx6kho30j.com",
"xn----9hciecaaawbbp1b1cd.net", "rudis.net"))), equals(7))

})

context("is")
test_that("we can test whether a domain is encoded", {

  expect_that(sum(is_punycode(c("gr€€n.no", "זגורי-אימפריה-לצפייה-ישירה.net", "ثبت-دومین.com",
"טיול-לפיליפינים.net", "xn------qpeiobbci9acacaca2c8a6ie7b9agmy.net", "xn----0mcgcx6kho30j.com",
"xn----9hciecaaawbbp1b1cd.net", "rudis.net"))), equals(3))

  expect_that(sum(is_idna(c("gr€€n.no", "זגורי-אימפריה-לצפייה-ישירה.net", "ثبت-دومین.com",
"טיול-לפיליפינים.net", "xn------qpeiobbci9acacaca2c8a6ie7b9agmy.net", "xn----0mcgcx6kho30j.com",
"xn----9hciecaaawbbp1b1cd.net", "rudis.net"))), equals(4))


})



