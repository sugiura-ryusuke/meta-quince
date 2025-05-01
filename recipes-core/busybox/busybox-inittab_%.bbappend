FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = " \
    file://inittab \
"

do_install() {
	install -d ${D}${sysconfdir}
	install -D -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab

    CONSOLES="${SERIAL_CONSOLES}"
    for s in $CONSOLES
    do
        speed=$(echo $s | cut -d\; -f1)
        device=$(echo $s | cut -d\; -f2)
        label=$(echo $device | sed -e 's/tty//' | tail --bytes=5)

        echo "$device::respawn:${sbindir}/ttyrun $device ${base_sbindir}/getty $speed $device" >> ${D}${sysconfdir}/inittab
    done
}

USE_VT = "0"
SYSVINIT_ENABLED_GETTYS = ""

