# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Gruvbox Material themes for GTK"
HOMEPAGE="https://github.com/gustavothecoder/gruvbox-material-gtk"
EGIT_REPO_URI="${HOMEPAGE}.git"

SLOT="0"
LICENSE="Unlicense"
KEYWORDS="amd64 arm64 ppc64 x86"

IUSE="+hard soft doc"

src_install() {
	insinto /usr/share/themes
	use hard && doins -r Gruvbox-Material-Hard
	use soft && doins -r Gruvbox-Material-Soft
	use doc && dodoc *.md
}
