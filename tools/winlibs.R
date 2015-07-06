# Build against static libraries compiled with the Rtools
if(!file.exists("../windows/libidn-1.30/include/idna.h")){
  setInternet2()
  download.file("https://github.com/rwinlib/libidn/archive/v1.30.zip", "lib.zip", quiet = TRUE)
  dir.create("../windows", showWarnings = FALSE)
  unzip("lib.zip", exdir = "../windows")
  unlink("lib.zip")
}
