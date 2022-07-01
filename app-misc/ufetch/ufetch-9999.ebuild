# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Tiny system info"
HOMEPAGE="https://gitlab.com/jschx/ufetch"
if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/-/archive/master/${PN}-master.tar.gz"
fi

SLOT="0"
LICENSE="ISC"
KEYWORDS="~amd64"
IUSE="doc"

src_install() {
	exeinto /usr/bin
	newexe  ${PN}-gentoo ${PN}
	use doc && dodoc README.md
}
