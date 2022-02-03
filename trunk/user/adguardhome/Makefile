THISDIR := $(shell pwd)
VERSION := 0.107.3
BIN_NAME:= AdGuardHome_linux_mipsle_softfloat.tar.gz
BIN_URL := https://github.com/AdguardTeam/AdGuardHome/releases/download/v$(VERSION)/$(BIN_NAME)

BIN_PREFIX := adguardhome-mipsle

all: download_test
	@echo "adguardhome build ok!"

download_test:
	( if [ ! -f $(BIN_PREFIX)-$(VERSION) ]; then \
		if [ ! -d $(BIN_NAME) ]; then \
			wget -t5 --timeout=20 --no-check-certificate -O $(BIN_NAME) $(BIN_URL); \
		fi; \
		tar -xf $(BIN_NAME); \
		mv AdGuardHome/AdGuardHome $(BIN_PREFIX)-$(VERSION); \
		rm -rf AdGuardHome; \
	fi )

clean:
	@echo "adguardhome clean ok!"

romfs:
	$(ROMFSINST) -S -p +x $(THISDIR)/$(BIN_PREFIX)-$(VERSION) /usr/bin/adguard
	$(ROMFSINST) -p +x $(THISDIR)/adguard.sh /usr/bin/adguard.sh

