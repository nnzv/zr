# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

EF_PN=github.com/wyatt8740/IBM3161-font
DESCRIPTION="The monospaced bitmap font from IBM's 1985 'ASCII Display Station"
HOMEPAGE="https://${EF_PN}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
fi

LICENSE="GPL-2"
FONT_S="${S}/truetype"
SLOT="0"
FONT_SUFFIX="ttf"
