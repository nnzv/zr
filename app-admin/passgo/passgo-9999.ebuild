# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGO_PN=github.com/ejcx/${PN}

inherit go-module

EGO_SUM=(
	"github.com/atotto/clipboard v0.1.1"
	"github.com/atotto/clipboard v0.1.1/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.0"
	"github.com/inconshreveable/mousetrap v1.0.0/go.mod"
	"github.com/spf13/cobra v0.0.3"
	"github.com/spf13/cobra v0.0.3/go.mod"
	"github.com/spf13/pflag v1.0.3"
	"github.com/spf13/pflag v1.0.3/go.mod"
	"golang.org/x/crypto v0.0.0-20190222235706-ffb98f73852f"
	"golang.org/x/crypto v0.0.0-20190222235706-ffb98f73852f/go.mod"
	"golang.org/x/sys v0.0.0-20190222171317-cd391775e71e"
	"golang.org/x/sys v0.0.0-20190222171317-cd391775e71e/go.mod"
)

DESCRIPTION="Simple golang password manager"
HOMEPAGE="https://github.com/ejecx/passgo"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://${EGO_PN}.git"
else
	SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
			${EGO_SUM_SRC_URI}"
fi

SLOT="0"
LICENSE="MIT"
IUSE="doc"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

BDEPEND=">=dev-lang/go-1.11"

DOCS=(
	LICENSE
	README.md
)

src_unpack() {
	if [[ ${PV} == *9999 ]]; then
		git-r3_src_unpack
		go-module_live_vendor
	else
		go-module_src_unpack
	fi
}

src_compile() {
	ego build
}

src_install() {
	dobin ${PN}
	use doc && einstalldocs
}
