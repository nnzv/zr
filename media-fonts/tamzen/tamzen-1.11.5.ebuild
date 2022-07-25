# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

EF_PN=github.com/sunaku/tamzen-font
DESCRIPTION="Bitmap font, based on Tamsyn"
HOMEPAGE="https://${EF_PN}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	# tamzen-9999 <- ${P^t} -> Tamzen-9999
	SRC_URI="${HOMEPAGE}/archive/refs/tags/${P^t}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
fi

S="${WORKDIR}/${PN}-font-${P^t}/ttf"
LICENSE="Custom"
SLOT="0"
FONT_SUFFIX="ttf"
