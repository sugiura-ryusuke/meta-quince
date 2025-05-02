python do_populate_lic_deploy:append() {
    quince_deploy_dir = 'deploy-' + d.getVar('IMAGE_BASENAME') + '-' + d.getVar('MACHINE')
    image_basename = d.getVar('IMAGE_BASENAME')
    machine = d.getVar('MACHINE')
    image_link_name = d.getVar('IMAGE_LINK_NAME')
    quince_rootfs_img_file = d.getVar('QUINCE_ROOTFS_IMG_FILE')
    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
    license_image_dir = d.getVar('LICENSE_DIRECTORY') + '/' + d.getVar('SSTATE_PKGARCH') + '/' + d.getVar('IMAGE_LINK_NAME')
    buildhistory_dir = d.getVar('BUILDHISTORY_DIR')
    buildhistory_dir_image = d.getVar('BUILDHISTORY_DIR_IMAGE')

    if os.path.isfile('scripts/deploy.sh'):
        os.system("scripts/deploy.sh {} {} {} {} {} {} {} {} {}".format(quince_deploy_dir, image_basename, machine, image_link_name, quince_rootfs_img_file, deploy_dir_image, license_image_dir, buildhistory_dir, buildhistory_dir_image))

    image_rootfs = d.getVar('IMAGE_ROOTFS')
    rootfs_size_file = quince_deploy_dir + '/rootfs_size.txt'
    os.system("du -sh {} > {}".format(image_rootfs, rootfs_size_file))
    with open(rootfs_size_file) as f:
        s = f.read()
        bb.plain(s)
}

