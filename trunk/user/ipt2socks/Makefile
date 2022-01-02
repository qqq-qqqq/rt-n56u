VERSION = 1.1.3
SRC_NAME = ipt2socks-$(VERSION)
URL_PATH = https://github.com/zfl9/ipt2socks/archive/refs/tags/v$(VERSION).tar.gz
THISDIR = $(shell pwd)

all: download_test extract_test
	$(MAKE) -j$(HOST_NCPU) -C $(SRC_NAME) CC="$(CC)"
	
download_test:
	( if [ ! -f $(THISDIR)/$(SRC_NAME).tar.gz ]; then \
		wget -t5 --timeout=20 --no-check-certificate -O $(SRC_NAME).tar.gz $(URL_PATH); \
	fi )

extract_test:
	( if [ ! -d $(SRC_NAME) ]; then \
		tar zxf $(SRC_NAME).tar.gz ; \
	fi )

config_test:
	( if [ -f ./config_done ]; then \
		echo "the same configuration"; \
	else \
		touch config_done; \
	fi )

clean:
	rm -rf $(SRC_NAME)
	rm -f config_done

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/$(SRC_NAME)/ipt2socks /usr/bin/ipt2socks

