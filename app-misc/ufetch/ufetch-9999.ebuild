# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ESH_PN=github.com/jschx/ufetch

DESCRIPTION="Tiny system info for Unix-like operating systems"
HOMEPAGE="https://${ESH_PN}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/archive/refs/heads/master.zip -> ${PN}-9999"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
fi

SLOT="0"
LICENSE="ISC"
IUSE="doc"
DOC=( LICENSE README.md )

src_install() {
	exeinto /usr/bin
	newexe  ${PN}-gentoo ${PN}
	use doc && einstalldocs
}
