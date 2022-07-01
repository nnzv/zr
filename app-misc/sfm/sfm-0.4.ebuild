# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig

DESCRIPTION="Simple file manager"
HOMEPAGE="https://git.afify.dev/sfm/file/README.md.html"
SRC_URI="https://github.com/afify/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
IUSE="doc"
KEYWORDS="amd64 ~arm arm64 ppc ppc64 ~riscv x86"

src_prepare() {
	default
	restore_config config.h
}

src_install() {
	emake PREFIX="${D}/usr" install
	use doc && dodoc README.md
	save_config config.h
}
