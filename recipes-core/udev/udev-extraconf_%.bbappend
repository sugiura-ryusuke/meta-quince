FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://mmcblk \
    file://usb \
"

do_install:append() {
	install -d ${D}${sysconfdir}/udev/mount.ignorelist.d

	if ${@bb.utils.contains('QUINCE_DISABLE_AUTOMOUNT_STORAGE', '1', 'true', 'false', d)}; then
		install -m 0644 ${WORKDIR}/mmcblk ${D}${sysconfdir}/udev/mount.ignorelist.d
		install -m 0644 ${WORKDIR}/usb ${D}${sysconfdir}/udev/mount.ignorelist.d
	fi
}

