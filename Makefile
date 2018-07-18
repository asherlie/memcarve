CFLAGS       = -c -fPIC -Wall -Wextra -Wpedantic -Werror -Wno-unused-result -std=c99 -O3 -D_GNU_SOURCE
LDFLAGS      = -shared
CXX = gcc
all: libmemcarve

libmemcarve:
	$(CXX) $(CFLAGS) vmem_access.c vmem_parser.c
	$(CXX) $(LDFLAGS) vmem_access.o vmem_parser.o -o libmemcarve.so

clean:
	rm -f *.o *.so
