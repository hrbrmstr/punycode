## ----echo=FALSE----------------------------------------------------------
library(punycode)

## ------------------------------------------------------------------------
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

puny_encode(ascii_doms)

## ------------------------------------------------------------------------
intnl_doms <- c("ثبت-دومین.com",
"טיול-לפיליפינים.net",
"бизнес-тренер.com",
"новый-год.com",
"東京ライブ-バルーンスタンド.com",
"看護師高収入-求人.net",
"ユベラ-贅沢ポリフェノール.biz",
"เด็ก-ภูเก็ต.com",
"ایران-هاست.com")

puny_decode(intnl_doms)

## ------------------------------------------------------------------------
for_valid <- c("gr€€n.no", "זגורי-אימפריה-לצפייה-ישירה.net", "ثبت-دومین.com",
"טיול-לפיליפינים.net", "xn------qpeiobbci9acacaca2c8a6ie7b9agmy.net", "xn----0mcgcx6kho30j.com",
"xn----9hciecaaawbbp1b1cd.net", "rudis.net")

puny_tld_check(for_valid)

