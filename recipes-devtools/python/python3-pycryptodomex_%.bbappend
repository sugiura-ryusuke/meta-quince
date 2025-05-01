FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

RDEPENDS:${PN} += " \
    ${PYTHON_PN}-cffi \
    ${PYTHON_PN}-ctypes \
    ${PYTHON_PN}-json \
    ${PYTHON_PN}-math \
    ${PYTHON_PN}-netclient \
    ${PYTHON_PN}-pickle \
    ${PYTHON_PN}-threading \
"

