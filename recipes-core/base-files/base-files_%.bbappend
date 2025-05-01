FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://fstab \
    file://issue \
    file://issue.net \
    file://resolv.conf \
"

do_install:append() {
	install -m 0755 -d ${D}/opt

	echo "${MACHINE}" > ${D}${sysconfdir}/machine

	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}
	install -m 0644 ${WORKDIR}/issue ${D}${sysconfdir}
	install -m 0644 ${WORKDIR}/issue.net ${D}${sysconfdir}
	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'false', 'true', d)}; then
		install -m 0644 ${WORKDIR}/resolv.conf ${D}${sysconfdir}
	fi
}

