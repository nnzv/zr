# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="A cross-platform x86 assembler with an Intel-like syntax"
HOMEPAGE="https://nasm.us"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/netwide-assembler/${PN}.git"
else
	SRC_URI="${HOMEPAGE}/pub/${PN}/releasebuilds/${PV}/${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
fi

SLOT="0"
LICENSE="BSD-2"
BDEPEND="dev-lang/perl"
DEPEND="${BDEPEND}"
IUSE="doc"
DOC=( AUTHORS README.md LICENSE INSTALL ChangeLog CHANGES *.txt version )

src_prepare() {
	default
	sh autogen.sh
}

src_configure() {
	sh configure
}

src_compile() {
	emake CC="$(tc-getCC)"
	emake strip
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	use doc && einstalldocs
}
