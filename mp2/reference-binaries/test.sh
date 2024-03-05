cd ../src
make
cd ../reference-binaries
./lexer ../test-1/ret0.cl | ./parser | ./semant | ./../src/cgen-1