# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

EF_PN=github.com/cmvnd/fonts
DESCRIPTION="Tiny bitmap fonts"
HOMEPAGE="https://${EF_PN}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
fi

LICENSE="GPL-3"
SLOT="0"
FONT_SUFFIX="bdf otb"
DOCS=( LICENSE install previews/preview{1,2,3}.png )
