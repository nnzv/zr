# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EC_PN=github.com/afify/sfm

DESCRIPTION="Simple file manager"
HOMEPAGE="https://git.afify.dev/sfm"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://${EC_PN}.git"
else
	SRC_URI="https://${EC_PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
fi

SLOT="0"
LICENSE="ISC"
IUSE="doc"
DOC=( LICENSE README.md )

src_prepare() {
	default
	restore_config config.h
}

src_install() {
	emake PREFIX="${D}/usr" install
	use doc && einstalldocs
	save_config config.h
}
