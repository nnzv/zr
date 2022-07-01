# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg

DESCRIPTION="Gnome Nord dark-theme"
HOMEPAGE="https://github.com/EliverLara/Nordic"
SRC_URI="https://github.com/EliverLara/Nordic/releases/download/v${PV}/Nordic-darker.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64 ppc64 x86"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/themes
	doins -r Nordic-darker
}
