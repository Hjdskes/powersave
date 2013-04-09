pkgname=powersave-git
pkgbase=powersave
pkgver=2013.03.28
pkgrel=1
pkgdesc='Enables powersave based on battery state'
arch=('any')
url='https://github.com/Unia/Powersave'
license=('GPL2')
depends=('iw' 'hdparm' 'xorg-xset' 'systemd-tools' 'udisks2')
makedepends=('git')
conflicts=('powerdown')
install='powersave.install'

_gitroot="https://github.com/Unia/$pkgbase"
_gitname="$pkgbase"

pkgver() {
    cd "$srcdir/$_gitname"
    git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=1 $_gitroot $_gitname
 		cd $_gitname
	fi
	sg "GIT checkout done or server timeout"
}

package() {
	make DESTDIR="$pkgdir" install
}
