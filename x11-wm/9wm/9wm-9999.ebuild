# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="WM inspired by Plan 9's rio"
HOMEPAGE="https://github.com/9wm"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}/${PN}.git"
else
	SRC_URI="${HOMEPAGE}/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
fi

SLOT="0"
LICENSE="MIT"
RDEPEND="
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXft
	x11-libs/libXrandr
	x11-libs/libXrender
"
DEPEND="${RDEPEND}"
IUSE="doc"
DOC=( CREDITS.md CUSTOMIZING.md LICENSE.md README.md TODO.txt )

src_compile() {
	emake CC="$(tc-getCC)" ${PN}
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install install.man
	use doc && einstalldocs
}
