# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="3x3 Font for Nerds"
HOMEPAGE="https://cargocollective.com/slowercase/318485/3x3-Font-for-Nerds"
SRC_URI="https://www.wfonts.com/download/data/${PV}/11/04/3x3-font-for-nerds/3x3-font-for-nerds.zip"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~m68k ppc ppc64 ~riscv x86"
FONT_SUFFIX="ttf"
S="${WORKDIR}"

src_prepare() {
	default
	touch README.md
}
