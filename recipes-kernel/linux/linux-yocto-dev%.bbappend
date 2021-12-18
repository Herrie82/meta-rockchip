FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE:marsboard-rk3066 = "marsboard-rk3066"
COMPATIBLE_MACHINE:rock2-square = "rock2-square"
COMPATIBLE_MACHINE:radxarock = "radxarock"
COMPATIBLE_MACHINE:firefly-rk3288 = "firefly-rk3288"
COMPATIBLE_MACHINE:vyasa-rk3288 = "vyasa-rk3288"
COMPATIBLE_MACHINE:tinker-board = "tinker-board"
COMPATIBLE_MACHINE:tinker-board-s = "tinker-board-s"
COMPATIBLE_MACHINE:rock-pi-4 = "rock-pi-4"
COMPATIBLE_MACHINE:nanopi-m4 = "nanopi-m4"
COMPATIBLE_MACHINE:nanopi-m4-2gb = "nanopi-m4-2gb"
COMPATIBLE_MACHINE:rock64 = "rock64"
COMPATIBLE_MACHINE:rock-pi-e = "rock-pi-e"
COMPATIBLE_MACHINE:pinephonepro = "pinephonepro"

# yaml and dtschema are required for 5.16+ device tree validation, libyaml is checked
# via pkgconfig, so must always be present, but we can wrap the others to make them
# conditional

DEPENDS:append = " gmp-native libmpc-native libyaml-native libyaml yaml-cpp python3-dtschema-wrapper-native"

SRC_URI_machine:pinephonepro:append = " \
file://1.patch \
file://2.patch \
file://defconfig \
"

do_patch:prepend() {
    rm -rf ${S}/arch/arm64/configs/defconfig
    cp -v -f ${WORKDIR}/defconfig ${S}/arch/arm64/configs/defconfig
    #cp -v -f ${S}/arch/arm64/configs/defconfig ${WORKDIR}/defconfig 
    #cp -v -f ${WORKDIR}/extra.cfg ${WORKDIR}/extra.cfg
}

#KBUILD_DEFCONFIG = "defconfig"
