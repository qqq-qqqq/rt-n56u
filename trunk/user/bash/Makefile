SRC_NAME = bash-5.1.16
SRC_URL = https://ftp.gnu.org/gnu/bash/$(SRC_NAME).tar.gz
THISDIR = $(shell pwd)

all: download_test extract_test config_test
	$(MAKE) -C $(SRC_NAME) -j
	$(MAKE) -C $(SRC_NAME) install DESTDIR=$(THISDIR)/install

download_test:
	( if [ ! -f $(SRC_NAME).tar.gz ]; then \
		wget -t5 --timeout=20 --no-check-certificate -O $(SRC_NAME).tar.gz $(SRC_URL); \
	fi )

extract_test:
	( if [ ! -d $(SRC_NAME) ]; then \
		tar -xf $(SRC_NAME).tar.gz; \
	fi )

config_test:
	( if [ -f $(THISDIR)/config_done ]; then \
		echo "the same configuration"; \
	else \
		make configure && touch config_done; \
	fi )

configure:
	( cd $(SRC_NAME); \
	./configure \
		--prefix=/ \
		--host=$(HOST_TARGET) \
		--build=$(HOST_BUILD) \
		ac_cv_header_sys_random_h=no \
		bash_cv_termcap_lib=gnutermcap \
	)

clean:
	rm -f config_done
	rm -rf $(THISDIR)/install
	rm -rf $(THISDIR)/$(SRC_NAME)

romfs:
	$(ROMFSINST) $(THISDIR)/install/bin/bash /bin/bash

