# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info linux-mod

DESCRIPTION="Tutanota desktop client"
HOMEPAGE="tutanota.com"
SRC_URI="https://github.com/tutao/${PN}/archive/refs/tags/${PN}-desktop-release-${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT=network-sandbox
IUSE="fonts"
DEPEND=" fonts? ( media-fonts/open-sans )"
BDEPEND="${DEPEND} net-libs/nodejs[npm]"
RDEPEND="
		sys-fs/fuse:0
		app-crypt/libsecret
"

S="${WORKDIR}/${PN}-${PN}-desktop-release-${PV}"

FLAGS=(
	--color    false
	--audit    false
	--foreground-scripts
	--save-dev
	--progress false
	--verbose
)

pkg_setup() {
	CONFIG_CHECK="FUSE_FS"
	ERROR_FUSE_FS="${CONFIG_CHECK} needs to be built as module to continue"
	linux-mod_pkg_setup
}

src_prepare() {
	default
	npm "${FLAGS[@]}" ci || die
}

src_compile() {
	npm "${FLAGS[@]}" run build -ws || die
	node desktop -c || die
}

src_install() {
	cd build/desktop || die
	newbin *.AppImage ${PN}
}
