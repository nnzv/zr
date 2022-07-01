# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#inherit xdg

DESCRIPTION="deepin v20 icons"
HOMEPAGE="https://www.gnome-look.org/p/1414053"
if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/zayronxio/Uos-fulldistro-icons"
	else
	SRC_URI="https://github.com/zayronxio/Uos-fulldistro-icons/archive/refs/tags/${PV}.tar.gz
		-> ${P}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64 ppc64 x86"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/icons
	doins -r ${P}
}
