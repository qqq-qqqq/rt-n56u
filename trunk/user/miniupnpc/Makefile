VERSION  = 2.2.3
SRC_NAME = miniupnpc-$(VERSION)
SRC_URL  = http://miniupnp.free.fr/files/download.php?file=$(SRC_NAME).tar.gz
THISDIR  = $(shell pwd)

LDFLAGS += -L$(STAGEDIR)/lib

all: download_test extract_test config_test
	$(MAKE) -C $(SRC_NAME)

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
		touch config_done; \
	fi )

clean:
	rm -f config_done
	rm -rf $(THISDIR)/$(SRC_NAME)

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/$(SRC_NAME)/build/upnpc-static /usr/bin/upnpc
	$(ROMFSINST) -p +x $(THISDIR)/$(SRC_NAME)/build/listdevices /usr/bin/listdeivces
	$(ROMFSINST) -p +x $(THISDIR)/$(SRC_NAME)/external-ip.sh /usr/bin/external-ip
