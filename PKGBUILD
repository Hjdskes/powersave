# Maintainer: Unia <jthidskes@outlook.com> 

pkgname=powersave-git
_gitname=powersave
pkgver=2013.04.10
pkgrel=1
pkgdesc="Powersave script, compatible with systemd through udev rules"
arch=('any')
url="https://github.com/Unia/powersave"
license=('GPL2')
depends=('bash' 'iw' 'hdparm' 'xorg-xset' 'systemd-tools' 'udisks2')
makedepends=('git')
source=('git://github.com/Unia/powersave.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
  :
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
