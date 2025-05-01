FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://defconfig \
    file://modules \
    file://ntpd.sh \
    file://rc.local.in \
    file://syslog-startup.conf \
"

do_compile:append() {
	sed -e "s/@@DISTRO@@/${DISTRO}/" \
        "${WORKDIR}/rc.local.in" > "${WORKDIR}/rc.local"
}

do_install:append() {
	if grep -q "CONFIG_SYSLOGD=y" ${B}/.config && ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'busybox', 'true', 'false', d)}; then
		install -m 644 ${WORKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf
	fi

	if grep -q "CONFIG_SYSLOGD=y" ${B}/.config && grep -q "CONFIG_INIT=y" ${B}/.config && ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'busybox', 'true', 'false', d)}; then
		install -d ${D}${sysconfdir}/rcS.d
		ln -s ../init.d/syslog ${D}${sysconfdir}/rcS.d/S10syslog
	fi

	if grep -q "CONFIG_INIT=y" ${B}/.config && ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'busybox', 'true', 'false', d)}; then
		install -d ${D}${sysconfdir}/rcS.d
		install -D -m 0755 ${WORKDIR}/modules ${D}${sysconfdir}/init.d/modules
		ln -s ../init.d/modules ${D}${sysconfdir}/rcS.d/S20modules
	fi

	if grep -q "CONFIG_NTPD=y" ${B}/.config && grep -q "CONFIG_INIT=y" ${B}/.config && ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'busybox', 'true', 'false', d)}; then
		install -d ${D}${sysconfdir}/rcS.d
		install -D -m 0755 ${WORKDIR}/ntpd.sh ${D}${sysconfdir}/init.d/ntpd.sh
		ln -s ../init.d/ntpd.sh ${D}${sysconfdir}/rcS.d/S40ntpd
	fi

	if grep -q "CONFIG_MDEV=y" ${B}/.config && grep -q "CONFIG_INIT=y" ${B}/.config && ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'busybox', 'true', 'false', d)}; then
		install -d ${D}${sysconfdir}/rcS.d
		ln -s ../init.d/mdev ${D}${sysconfdir}/rcS.d/S60mdev
	fi

	if grep -q "CONFIG_INIT=y" ${B}/.config && ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'busybox', 'true', 'false', d)}; then
		install -d ${D}${sysconfdir}/rcS.d
		install -D -m 0755 ${WORKDIR}/rc.local ${D}${sysconfdir}/init.d/rc.local
		ln -s ../init.d/rc.local ${D}${sysconfdir}/rcS.d/S99rc.local
	fi
}

