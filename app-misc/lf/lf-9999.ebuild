# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGO_PN=github.com/gokcehan/lf

inherit go-module xdg bash-completion-r1

EGO_SUM=(
	"github.com/gdamore/encoding v1.0.0"
	"github.com/gdamore/encoding v1.0.0/go.mod"
	"github.com/gdamore/tcell/v2 v2.3.1"
	"github.com/gdamore/tcell/v2 v2.3.1/go.mod"
	"github.com/lucasb-eyer/go-colorful v1.0.3"
	"github.com/lucasb-eyer/go-colorful v1.0.3/go.mod"
	"github.com/mattn/go-runewidth v0.0.10"
	"github.com/mattn/go-runewidth v0.0.10/go.mod"
	"github.com/rivo/uniseg v0.1.0"
	"github.com/rivo/uniseg v0.1.0/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20220209214540-3681064d5158"
	"golang.org/x/sys v0.0.0-20220209214540-3681064d5158/go.mod"
	"golang.org/x/term v0.0.0-20201210144234-2321bbc49cbf/go.mod"
	"golang.org/x/term v0.0.0-20210220032956-6a3ed077a48d"
	"golang.org/x/term v0.0.0-20210220032956-6a3ed077a48d/go.mod"
	"golang.org/x/text v0.3.0"
	"golang.org/x/text v0.3.0/go.mod"
	"gopkg.in/djherbis/times.v1 v1.2.0"
	"gopkg.in/djherbis/times.v1 v1.2.0/go.mod"
)

DESCRIPTION="Terminal file manager"
HOMEPAGE="pkg.go.dev/github.com/gokcehan/lf"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://${EGO_PN}.git"
else
	SRC_URI="https://${EGO_PN}/archive/r${PV}.tar.gz -> ${P}.tar.gz
			${EGO_SUM_SRC_URI}"
	src_compile() {
		# avoid error on non-live ebuilds
		version="${PV}" gen/build.sh || die
	}
fi

SLOT="0"
LICENSE="MIT"
IUSE="doc desktop bash zsh fish vim"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

BDEPEND="dev-lang/go"

DOCS=(
	LICENSE
	README.md
	etc/${PN}.vim
	etc/colors.example
	etc/icons.example
	etc/${PN}rc.example
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
	gen/build.sh || die
}

pkg_preinst() {
	use desktop && xdg_pkg_preinst
}

src_install() {
	dobin ${PN}
	use doc && einstalldocs
	doman *.1

	if use bash; then
		newbashcomp etc/${PN}.bash ${PN}
	fi

	if use zsh; then
		insinto /usr/share/zsh/site-functions
		newins "etc/${PN}.zsh" "_${PN}"
	fi

	if use fish; then
		insinto /usr/share/fish/vendor_completions.d
		doins "etc/${PN}.fish"
		insinto /usr/share/fish/vendor_functions.d
		doins "etc/${PN}cd.fish"
	fi
}
