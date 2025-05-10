python do_populate_lic_deploy:append() {
    quince_target_deploy_dir = 'target-' + d.getVar('IMAGE_BASENAME') + '-' + d.getVar('MACHINE')
    image_basename = d.getVar('IMAGE_BASENAME')
    machine = d.getVar('MACHINE')
    image_link_name = d.getVar('IMAGE_LINK_NAME')
    quince_rootfs_img_file = d.getVar('QUINCE_ROOTFS_IMG_FILE')
    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
    license_image_dir = d.getVar('LICENSE_DIRECTORY') + '/' + d.getVar('SSTATE_PKGARCH') + '/' + d.getVar('IMAGE_LINK_NAME')
    buildhistory_dir = d.getVar('BUILDHISTORY_DIR')
    buildhistory_dir_image = d.getVar('BUILDHISTORY_DIR_IMAGE')

    if os.path.isfile('scripts/deploy-target.sh'):
        os.system("scripts/deploy-target.sh {} {} {} {} {} {} {} {} {}".format(quince_target_deploy_dir, image_basename, machine, image_link_name, quince_rootfs_img_file, deploy_dir_image, license_image_dir, buildhistory_dir, buildhistory_dir_image))
        bb.plain("target deploy directory: {}".format(quince_target_deploy_dir))

    image_rootfs = d.getVar('IMAGE_ROOTFS')
    rootfs_size_file = quince_target_deploy_dir + '/rootfs_size.txt'
    os.system("du -sh {} | cut -d/ -f1 > {}".format(image_rootfs, rootfs_size_file))
    with open(rootfs_size_file) as f:
        s = f.readline().rstrip('\n')
        bb.plain("rootfs size: {}".format(s))

    image_ext4_file = quince_target_deploy_dir + '/rootfs/' + quince_rootfs_img_file
    if os.path.isfile(image_ext4_file):
        image_ext4_file_size = os.path.getsize(image_ext4_file)
        image_rootfs_size = int(d.getVar('IMAGE_ROOTFS_SIZE')) * 1024
        bb.plain("ext4 file size: {}".format(image_ext4_file_size))
        bb.plain("image rootfs size: {}".format(image_rootfs_size))
        if image_ext4_file_size > image_rootfs_size:
             bb.warn('ext4 file size exceeds IMAGE_ROOTFS_SIZE.')
}

python do_populate_sdk:append() {
    quince_sdk_deploy_dir = 'sdk-' + d.getVar('IMAGE_BASENAME') + '-' + d.getVar('MACHINE')
    sdkdeploydir = d.getVar('SDKDEPLOYDIR')
    toolchain_outputname = d.getVar('TOOLCHAIN_OUTPUTNAME')

    if os.path.isfile('scripts/deploy-sdk.sh'):
        os.system("scripts/deploy-sdk.sh {} {} {}".format(quince_sdk_deploy_dir, sdkdeploydir, toolchain_outputname))
        bb.plain("sdk deploy directory: {}".format(quince_sdk_deploy_dir))
}

