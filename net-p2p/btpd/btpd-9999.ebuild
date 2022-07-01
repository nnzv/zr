# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The BitTorrent Protocol Daemon"
HOMEPAGE="https://github.com/btpd"
if [[ "${PV}" == *9999 ]]; then
	EGIT_REPO_URI="${HOMEPAGE}.git"
	inherit git-r3
else
	SRC_URI="${HOMEPAGE}/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="IPC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
BDEPEND="dev-libs/openssl"

src_configure() {
	econf
}

src_install() {
	emake PREFIX="${D}/usr" install
}
