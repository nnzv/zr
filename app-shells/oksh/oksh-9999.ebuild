# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ibara/oksh"
else
	SRC_URI="https://github.com/ibara/oksh/archive/refs/tags/${P}.tar.gz"
fi

DESCRIPTION="Portable OpenBSD ksh"
HOMEPAGE="https://github.com/ibara/oksh"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv sparc x86 ~amd64-linux ~x86-linux"

IUSE="doc"
LICENSE="BSD ISC"
SLOT="0"

src_prepare() {
	default
	# Generate Makefile
	econf
}

src_compile() {
	emake
}

src_install() {
	# Basic
	dodir /bin
	mv "${PN}" "${ED}/bin/" || die
	doman "${PN}.1"

	insinto /etc/
	doins "ksh.kshrc"

	DOCS=( CONTRIBUTORS LEGAL NOTES PROJECTS README.{md,pdksh} )
	use doc && einstalldocs
}

pkg_preinst() {
	local bin=/bin/oksh
	# Add oksh to /etc/shells
	grep -q $bin "/etc/shells" || echo $bin >> $_

}
