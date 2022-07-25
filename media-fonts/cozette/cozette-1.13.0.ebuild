# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

EF_PN=github.com/slavfox/Cozette
DESCRIPTION="A bitmap programming font optimized for coziness"
HOMEPAGE="https://${EF_PN}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}.git"
	# Build process no implement yet
	# Please: don't use *9999.ebuild
else
	# cozzete <- ${PN^c} -> Cozette
	SRC_URI="${HOMEPAGE}/releases/download/v.${PV}/${PN^c}Fonts.zip -> ${P}.zip"
	KEYWORDS="*"
fi

S="${WORKDIR}/${PN^c}Fonts"
LICENSE="MIT"
DEPEND="app-arch/unzip"
SLOT="0"
FONT_SUFFIX="ttf dfont otf otb fnt bdf"
