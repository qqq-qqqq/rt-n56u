VERSION  = 3.0
SRC_NAME = n2n-$(VERSION)
SRC_URL  = https://github.com/ntop/n2n/archive/refs/tags/$(VERSION).tar.gz
THISDIR  = $(shell pwd)

LDFLAGS += -L$(STAGEDIR)/lib

all: download_test extract_test config_test
	$(MAKE) -C $(SRC_NAME)
	$(MAKE) -C $(SRC_NAME) install DESTDIR=$(THISDIR)/install

download_test:
	( if [ ! -f $(THISDIR)/$(SRC_NAME).tar.gz ]; then \
		wget -t5 --timeout=20 --no-check-certificate -O $(SRC_NAME).tar.gz $(SRC_URL); \
	fi )

extract_test:
	( if [ ! -d $(THISDIR)/$(SRC_NAME) ]; then \
		tar -xf $(SRC_NAME).tar.gz ; \
	fi )

config_test:
	( if [ -f $(THISDIR)/config_done ]; then \
		echo "the same configuration"; \
	else \
		make configure && touch config_done; \
	fi )

configure:
	( cd $(SRC_NAME) ; \
	./autogen.sh; \
	PKG_CONFIG_PATH=$(STAGEDIR)/lib/pkgconfig \
	./configure \
		--prefix=/usr \
		--with-openssl \
		--host=$(HOST_TARGET) \
		--build=$(HOST_BUILD) \
	)

clean:
	rm -f config_done
	rm -rf $(THISDIR)/install
	rm -rf $(THISDIR)/$(SRC_NAME)

romfs:
	$(ROMFSINST) $(THISDIR)/install/usr/sbin/edge /usr/sbin/edge
	$(ROMFSINST) $(THISDIR)/install/usr/sbin/n2n-benchmark /usr/sbin/n2n-benchmark
