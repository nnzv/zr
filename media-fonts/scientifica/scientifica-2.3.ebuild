# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Tall, condensed, bitmap font for geeks"
HOMEPAGE="https://github.com/nerdypepper/scientifica"
SRC_URI="
	${HOMEPAGE}/releases/download/v${PV}/${PN}.tar -> ${P}.tar
	${HOMEPAGE}/archive/refs/tags/v${PV}.tar.gz    -> ${P}-2.tar.gz
"

IUSE="doc"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~m68k ppc ppc64 ~riscv x86"

FONT_SUFFIX="ttf"

S="${WORKDIR}/${PN}/ttf"

src_prepare() {
	default
	cp "${P}"/*.md "${S}"
}
