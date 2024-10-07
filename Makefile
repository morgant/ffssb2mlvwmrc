PREFIX ?=	/usr/local
PROG =		ffssb2mlvwmrc
BIN =		bin
BINDIR = 	${PREFIX}/${BIN}

lint:
	shellcheck ${BIN}/${PROG}

all: install

install:
	mkdir -p ${BINDIR}
	install -m755 ${BIN}/${PROG} ${BINDIR}

uninstall:
	rm -f ${BINDIR}/${PROG}
