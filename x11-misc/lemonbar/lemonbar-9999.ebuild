# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="A featherweight, lemon-scented, bar based on xcb"
HOMEPAGE="https://github.com/LemonBoy/bar"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/archive/refs/tags/v${PV}.tar.gz"
fi

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"

RDEPEND="x11-libs/xcb-util"

DEPEND="
	${RDEPEND}
	dev-lang/perl
"
IUSE="doc"

src_compile() {
	emake CC="$(tc-getCC)" ${PN}
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	use doc && dodoc *.pod
}
