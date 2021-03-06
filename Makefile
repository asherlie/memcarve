CFLAGS       = -c -fPIC -Wall -Wextra -Wpedantic -Werror -Wno-unused-result -std=c99 -O3 -D_GNU_SOURCE -lpthread
LDFLAGS      = -shared
CXX = gcc
all: libmemcarve.so

libmemcarve.so: vmem_access.c vmem_access.h
	$(CXX) $(CFLAGS) vmem_access.c vmem_parser.c
	$(CXX) $(LDFLAGS) vmem_access.o vmem_parser.o -o libmemcarve.so

install:
	 install libmemcarve.so /usr/lib/libmemcarve.so
	 ldconfig /usr/lib/libmemcarve.so
	 install vmem_access.h /usr/include/vmem_access.h
	 install vmem_parser.h /usr/include/vmem_parser.h

uninstall:
	rm -f /usr/lib/libmemcarve.so
	rm -f /usr/include/vmem_access.h
	rm -f /usr/include/vmem_parser.h

clean:
	rm -f *.o *.so
