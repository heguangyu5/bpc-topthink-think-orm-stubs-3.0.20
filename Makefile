libthink-orm-stubs.so:
	rm -rf think
	mkdir think
	phptobpc Exception.php > think/Exception.php
	phptobpc Facade.php > think/Facade.php
	cp Makefile ./think
	$(MAKE) -C ./think libthink-orm-stubs

libthink-orm-stubs:
	bpc -v \
	    -c ../../bpc-topthink-think-orm-3.0.20/think-orm-bpc.conf \
	    -l think-orm-stubs \
	    --pseudo-class-list think\\Exception,think\\Facade \
	    -u think-orm \
	    Exception.php Facade.php

install-libthink-orm-stubs:
	cd ./think && bpc -l think-orm-stubs --install
