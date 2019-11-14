INSTALL_PATH?=/usr/

all: rebuild

rebuild:
	mkdir -p src/obj
	$(MAKE) -C src ../libfct_read.a
	mkdir -p build
	cp include/* build/
	cp libfct_read.a build/
	rm -f libfct_read.a

install:
	mkdir -p $(INSTALL_PATH)/lib/
	mkdir -p $(INSTALL_PATH)/include/fct/include/
	cp build/libfct_read.a $(INSTALL_PATH)/lib/
	mv build/fct_read.h $(INSTALL_PATH)/include/fct/
	cp build/*.h $(INSTALL_PATH)/include/fct/include/

uninstall:
	rm -f $(INSTALL_PATH)/include/fct/fct_read.h
	rm -f $(INSTALL_PATH)/include/fct/include/*.h
	rmdir $(INSTALL_PATH)/include/fct/include
	rmdir $(INSTALL_PATH)/include/fct
	rm -f $(INSTALL_PATH)/lib/libfct_read.a

.PHONY: all install uninstall clean

clean:
	$(MAKE) -C src clean
	rm -rf build/
