# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Solarized dark theme"
HOMEPAGE="https://www.gnome-look.org/p/1311022"
if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_BRANCH="Solarized-Dark"
	EGIT_REPO_URI="https://github.com/rtlewis88/rtl88-Themes.git"
else
	SRC_URI="https://github.com/rtlewis88/rtl88-Themes/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/rtl88-Themes-${PV}"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="doc icons"
KEYWORDS="amd64 arm64 ppc64 x86"

src_install() {
	insinto /usr/share/themes
	use doc && dodoc *.md
	doins -r Solarized-Dark
	use icons && {
		insinto /usr/share/icons
		doins -r Solarized-Deluxe-Iconpack
	}
}
