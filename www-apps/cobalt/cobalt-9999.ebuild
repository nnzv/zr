# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	chrono-0.4.19
	clap-2.34.0
	deunicode-1.3.1
	env_logger-0.9.0
	exitfailure-0.5.1
	failure-0.1.8
	ghp-0.1.2
	html-minifier-3.0.14
	ignore-0.4.18
	itertools-0.10.1
	jsonfeed-0.2.0
	kstring-1.0.6
	lazy_static-1.4.0
	liquid-0.23.0
	liquid-core-0.23.0
	liquid-lib-0.23.0
	log-0.4.14
	mime_guess-2.0.3
	normalize-line-endings-0.3.0
	notify-4.0.17
	open-2.0.2
	pulldown-cmark-0.8.0
	regex-1.5.4
	relative-path-1.6.0
	rss-1.10.0
	sass-rs-0.2.2
	serde-1.0.130
	serde_json-1.0.72
	serde_yaml-0.8.21
	sitemap-0.4.1
	syntect-4.6.0
	tiny_http-0.9.0
	toml-0.5.8
	vimwiki-0.1.0
	walkdir-2.3.2
	assert_cmd-2.0.2
	assert_fs-1.0.6
	predicates-2.1.0
	similar-asserts-1.1.0
"

inherit cargo

DESCRIPTION="A static-site generator that works for you"
HOMEPAGE="https://cobalt-org.github.io"

if [[ "${PV}" == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/${PN}-org/${PN}.rs.git"
	inherit git-r3
else
	SRC_URI="https://github.com/${PN}-org/${PN}.rs/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris)"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"
BDEPEND="${RUST_DEPEND}"

src_unpack() {
	if [[ "${PV}" == *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_compile() {
	cargo_src_compile
}

src_install() {
	cargo_src_install
	use doc && dodoc *.md
}
