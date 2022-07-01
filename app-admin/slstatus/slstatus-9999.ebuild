# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig toolchain-funcs

DESCRIPTION="X status monitor"
HOMEPAGE="https://tools.suckless.org/slstatus"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.suckless.org/${PN}"
else
	SRC_URI="https://dl.suckless.org/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
fi

SLOT="0"
LICENSE="ISC"
RDEPEND="
	x11-libs/libX11
	x11-libs/libXft
"
DEPEND="${RDEPEND}"
IUSE="doc"

src_prepare() {
	default

	restore_config config.h
}

src_compile() {
	emake CC="$(tc-getCC)" ${PN}
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	use doc && dodoc README
	save_config config.h
}
