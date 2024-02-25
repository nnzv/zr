# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-pkg-2

DESCRIPTION="Reformats Java source code to comply with Google Java Style"
HOMEPAGE="https://github.com/google/google-java-format"
SRC_URI="${HOMEPAGE}/releases/download/v${PV}/${P}-all-deps.jar -> ${P}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=virtual/jdk-1.8:*"
RDEPEND=">=virtual/jre-1.8:*"

S="${WORKDIR}"

src_install() {
	java-pkg_newjar "${DISTDIR}"/${P}.jar ${PN}.jar
	java-pkg_dolauncher ${PN}
}
