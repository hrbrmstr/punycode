#!/bin/sh

rm -f src/*.o src/*.so \
      *~ \
      config.*  \
      src/Makevars src/symbols.rds
rm -rf autom4te.cache
