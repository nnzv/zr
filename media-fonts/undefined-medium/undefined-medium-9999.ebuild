# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

EF_PN=github.com/andirueckel/undefined-medium
DESCRIPTION="A free and open-source pixel grid-based monospace font"
HOMEPAGE="https://${EF_PN}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://${EF_PN}.git"
else
	SRC_URI="https://${EF_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
fi

S="${S}/fonts/ttf"
LICENSE="OFL"
SLOT="0"
FONT_SUFFIX="ttf"
