# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN=github.com/nnzv/td

inherit go-module

EGO_SUM=()

DESCRIPTION="The no-complex to-do list"
HOMEPAGE="https://${EGO_PN}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="https://${EGO_PN}/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
			 ${EGO_SUM_SRC_URI}"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
fi

SLOT="0"
LICENSE="BSD-2"
BDEPEND="dev-lang/go"
DEPEND="${BDEPEND}"
IUSE="doc"
DOC=( LICENSE README.adoc )

src_unpack() {
	if [[ ${PV} == *9999 ]]; then
		git-r3_src_unpack
		go-module_live_vendor
	else
		go-module_src_unpack
	fi
}

src_compile() {
	ego build -ldflags="-w -s" -o ${PN}
}

src_install() {
	dobin ${PN}
	doman ${PN}.1
	use doc && einstalldocs
}
