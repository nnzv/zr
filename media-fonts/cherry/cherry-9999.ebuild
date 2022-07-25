# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

EF_PN=github.com/turquoise-hexagon/cherry
DESCRIPTION="Another bitmap font"
HOMEPAGE="https://${EF_PN}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
fi

LICENSE="0BSD"
SLOT="0"
FONT_SUFFIX="bdf"
DOCS=( LICENSE README.md img/{10,11,12,13}.png )
