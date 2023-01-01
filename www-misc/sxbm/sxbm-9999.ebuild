# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple Unix Bookmark Manager"
HOMEPAGE="https://codeberg.org/NRK/sxbm"

if [[ "${PV}" == "*9999*" ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
SLOT="0"
LICENSE="GPL-3"
RDEPEND="
	sys-apps/gawk
	sys-apps/coreutils
	sys-apps/sed
"
DEPEND="${RDEPEND}"

src_install() {
	dobin ${PN}
}
