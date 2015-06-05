ifeq "{$R_ARCH}" "/x64"
PKG_CPPFLAGS = -I. -Ilibidn/x64/ -Ilibidn/x64/include/
PKG_LIBS = -Ilibidn/x64/lib/ -lidn
else
PKG_CPPFLAGS = -I. -Ilibidn/i386/ -Ilibidn/i386/include/
PKG_LIBS = -Ilibidn/i386/lib/ -lidn
endif
