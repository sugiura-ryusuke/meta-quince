SUMMARY  = "AES encryption for zipfile."
DESCRIPTION = "A replacement for Python's ``zipfile`` that can read and write AES encrypted \
zip files. Forked from Python 3.7's ``zipfile`` module, it features the same \
``zipfile`` API from that time (most notably, lacking support for \
``pathlib``-compatible wrappers that were introduced in Python 3.8)."
HOMEPAGE = "https://github.com/danifus/pyzipper"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=4a6ce89f8836606b2fa79b7d8e898868"

SRC_URI[md5sum] = "9e2c5425b93dd789ecf3264cadc0f12d"
SRC_URI[sha256sum] = "0adca90a00c36a93fbe49bfa8c5add452bfe4ef85a1b8e3638739dd1c7b26bfc"

inherit pypi setuptools3

RDEPENDS:${PN} = " \
    ${PYTHON_PN}-compile \
    ${PYTHON_PN}-compression \
    ${PYTHON_PN}-pycryptodomex \
"

BBCLASSEXTEND = "native nativesdk"

