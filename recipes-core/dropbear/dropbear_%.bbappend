FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

do_install:append() {
	if ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'busybox', 'true', 'false', d)}; then
		install -d ${D}${sysconfdir}/rcS.d
		ln -s ../init.d/dropbear ${D}${sysconfdir}/rcS.d/S50dropbear
	fi
}

