THISDIR := $(shell pwd)
VERSION := 0.0.20220117

BIN_PREFIX := wireguard-go-mipsle

all: 
	@echo "wireguard-go build ok!"

clean:
	@echo "wireguard-go clean ok!"

romfs:
	$(ROMFSINST) -S -p +x $(THISDIR)/$(BIN_PREFIX)-$(VERSION) /usr/bin/wireguard

