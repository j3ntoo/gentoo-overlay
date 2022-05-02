# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake xdg-utils

DESCRIPTION="Japanese SKK input methods for Fcitx"
HOMEPAGE="https://fcitx-im.org/ https://github.com/fcitx/fcitx-skk"
SRC_URI="https://download.fcitx-im.org/${PN}/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

BDEPEND="virtual/pkgconfig"
DEPEND=">=app-i18n/fcitx-4.2.9:4[X,xkb]
	app-i18n/libskk:=
	virtual/libintl"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DENABLE_QT=no"
	)
	cmake_src_configure
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
