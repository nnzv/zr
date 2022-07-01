# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple password manager"
HOMEPAGE="https://notabug.org/kl3/spm"
inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}.git"

SLOT="0"
LICENSE="ISC"

KEYWORDS="~amd64"
IUSE="doc"

RDEPEND="
	app-text/tree
	app-crypt/gnupg
"

DOCS=(
	LICENSE
	README.md
)

src_compile() {
	# nothing to do
	:
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	use doc && einstalldocs
}
