SUMMARY  = "Fast and simple WSGI-framework for small web-applications."
DESCRIPTION = "Bottle is a fast and simple micro-framework for small web applications. It \
offers request dispatching (Routes) with URL parameter support, templates, \
a built-in HTTP Server and adapters for many third party WSGI/HTTP-server and \
template engines - all in a single file and with no dependencies other than the \
Python Standard Library."
HOMEPAGE = "https://bottlepy.org"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=8740fee0ffaa1364bffd091f9d316bbf"

SRC_URI[md5sum] = "3564bf7c5e348d6dee6dd13a89dd9330"
SRC_URI[sha256sum] = "e53803b9d298c7d343d00ba7d27b0059415f04b9f6f40b8d58b5bf914ba9d348"

inherit pypi setuptools3

RDEPENDS:${PN} = " \
    ${PYTHON_PN}-crypt \
    ${PYTHON_PN}-datetime \
    ${PYTHON_PN}-email \
    ${PYTHON_PN}-io \
    ${PYTHON_PN}-json \
    ${PYTHON_PN}-html \
    ${PYTHON_PN}-netclient \
    ${PYTHON_PN}-netserver \
    ${PYTHON_PN}-pickle \
    ${PYTHON_PN}-misc \
"

BBCLASSEXTEND = "native nativesdk"

