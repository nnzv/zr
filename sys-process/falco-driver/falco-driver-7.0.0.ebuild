# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1 linux-info cmake

DESCRIPTION="The Falco Kernel Module"
HOMEPAGE="https://falco.org/blog/choosing-a-driver/#kernel-module"
SRC_URI="https://github.com/falcosecurity/libs/archive/${PV}+driver.tar.gz -> ${P}.tar.gz"

LICENSE="GPL2 MIT Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

BDEPEND=">=dev-build/cmake-3.12"
RDEPEND=""
DEPEND="${RDEPEND} ${BDEPEND}"

S="${WORKDIR}/libs-${PV}-driver"

pkg_setup() {
	linux-mod-r1_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DUSE_BUNDLED_DEPS=ON
		-USE_BUNDLED_DRIVER=ON
		-DCREATE_TEST_TARGETS=OFF
		-DDRIVER_VERSION=${PV}
		-DDRIVER_NAME="falco"
		-DDRIVER_PACKAGE_NAME="falco"
		-DDRIVER_COMPONENT_NAME="falco-driver"
	)

	cmake_src_configure
}

src_compile() {
	local modlist=( falco=:"${BUILD_DIR}"/driver/src )
	local modargs=( KERNELDIR="${KV_OUT_DIR}" )

	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install
}
