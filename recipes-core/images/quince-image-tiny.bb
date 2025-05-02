SUMMARY = "quince tiny image"

LICENSE = "MIT"

inherit core-image

# Image Features
#   ssh-server-dropbear: Installs the Dropbear minimal SSH server.
IMAGE_FEATURES += "ssh-server-dropbear"

INIT_PKGS = " \
    init-ifupdown \
"

BSP_PKGS = " \
"

CONNECTIVITY_PKGS = " \
"

CORE_PKGS = " \
"

DEVTOOLS_PKGS = " \
"

EXTENDED_PKGS = " \
"

FILESYSTEMS_PKGS = " \
"

KERNEL_PKGS = " \
"

SUPPORT_PKGS = " \
"

def kernel_module_packages(d):
    s = d.getVar('KERNEL_MODULES')
    m = ''
    if s is not None:
        for i in s.split():
            m += ' kernel-module-' + i
    return m

#KERNEL_MODULE_PKGS = "${@kernel_module_packages(d)}"
#KERNEL_MODULE_PKGS = "kernel-modules"
KERNEL_MODULE_PKGS = " "

# Specify the packages to install into an image through the image class
IMAGE_INSTALL = " \
    packagegroup-core-boot \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    ${@bb.utils.contains("VIRTUAL-RUNTIME_init_manager", "busybox", "${INIT_PKGS}", "", d)} \
    ${CONNECTIVITY_PKGS} \
    ${CORE_PKGS} \
    ${DEVTOOLS_PKGS} \
    ${EXTENDED_PKGS} \
    ${KERNEL_PKGS} \
    ${SUPPORT_PKGS} \
    ${KERNEL_MODULE_PKGS} \
"

# The size in Kbytes for the generated image
IMAGE_ROOTFS_SIZE = "65536"

# Additional free disk space created in the image in Kbytes
IMAGE_ROOTFS_EXTRA_SPACE = "0"

# Specifies the list of locales to install into the image during the root filesystem construction process
IMAGE_LINGUAS = " "


include quince-image-deploy.inc

