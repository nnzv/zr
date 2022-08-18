# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Windows ISO drive burner"
HOMEPAGE="https://github.com/ValdikSS/windows2usb"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
fi

SLOT="0"
LICENSE="Apache-2.0"
RDEPEND="
	 app-arch/p7zip
	sys-block/ms-sys
	app-arch/wimlib
"
DEPEND="${RDEPEND}"

src_install() {
	dobin ${PN}
}
