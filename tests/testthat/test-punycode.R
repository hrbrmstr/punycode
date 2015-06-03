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
