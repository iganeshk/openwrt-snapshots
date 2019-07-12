<h1 align="center">
  <a href="https://github.com/iganeshk/openwrt-snapshots/" title="LaMetric LaMetric System Monitor">
    <img alt="OpenWRT Snapshots" src=".github/3200acm_openwrt.png" width="55%" />
  </a>
  <br />
  OpenWRT Snapshots
</h1>
<p align="center">
  Semi-Weekly snapshots for LinkSys routers including packages such NGINX (SSL), Wireguard, Samba 4, Zsh, etc. <br /><br />
    <strong>• <a href="https://iganesh.com/openwrt/" target="_blank" title="Download">Download</a> •</strong>
</p>

## How is this different from usual snapshots?

Although there is not much difference in the base files (yet) but includes the mostly used packages which saves time when performing bleeding edge upgrades and restoring packages. 

Combining it with script from [opkg-upgrade](https://github.com/iganeshk/opkg-upgrade), restoration of backups is possible is simplified as well.

### Usage

* Make sure to edit backup configuration to include, /root/ and /etc/ directories

* `./opkg-upgrade.sh -sys sysupgrade-file`

Performs upgrade and creates backup of system configuration at /root/, list of packages saved in /etc/backup/)

* `./opkg-upgrade.sh -res`

Performs restoration of installed packages (package configuration is already preserved from backup).

## List of included modifications

### Packages
<details><summary>Click to see</summary>
<p>

```
attr
avahi-dbus-daemon
bash
bzip2
ca-bundle
ca-certificates
coreutils
coreutils-date
coreutils-dircolors
curl
dbus
ddns-scripts
ddns-scripts_cloudflare.com-v4
git
git-http
gzip
htop
iftop
ip-tiny
iperf
iperf3
ipset
iptables-mod-conntrack-extra
iptables-mod-ipopt
jansson
jq
kmod-crypto-crc32c
kmod-crypto-md5
kmod-crypto-sha1
kmod-crypto-sha256
kmod-crypto-sha512
kmod-fs-ext4
kmod-fs-ntfs
kmod-fs-squashfs
kmod-fs-vfat
kmod-hwmon-core
kmod-hwmon-pwmfan
kmod-ifb
kmod-ipt-conntrack-extra
kmod-ipt-ipopt
kmod-ipt-ipset
kmod-ipt-raw
kmod-nfnetlink
kmod-nls-cp437
kmod-nls-iso8859-1
kmod-nls-utf8
kmod-sched-connmark
kmod-sched-core
kmod-tun
kmod-udptunnel4
kmod-udptunnel6
kmod-usb-ehci
kmod-usb2
kmod-usb3
kmod-wireguard
libaio
libarchive
libattr
libavahi-client
libavahi-dbus-support
libbz2
libcap
libcharset
libcomerr
libcurl
libdaemon
libdbus
libelf
libexpat
libgcrypt
libgd
libgpg-error
libipset
libiwinfo-lua
libjpeg
liblua
liblucihttp
liblucihttp-lua
liblzma
liblzo
libmbedtls
libmnl
libncurses
libopenssl
libopenssl-conf
libpcap
libpcre
libpng
libpopt
libqrencode
libreadline
librt
libsensors
libsodium
libssh2
libstdcpp
libsysfs
libtirpc
libubus-lua
libuci-lua
libustream-openssl
libuuid
lm-sensors
lua
luci
luci-app-advanced-reboot
luci-app-ddns
luci-app-firewall
luci-app-opkg
luci-app-qos
luci-app-samba4
luci-app-uhttpd
luci-app-wireguard
luci-base
luci-lib-ip
luci-lib-ipkg
luci-lib-json
luci-lib-jsonc
luci-lib-nixio
luci-mod-admin-full
luci-mod-network
luci-mod-rpc
luci-mod-status
luci-mod-system
luci-proto-ipv6
luci-proto-ppp
luci-proto-wireguard
luci-theme-bootstrap
luci-theme-material
miniupnpd
nano
nginx-ssl
nmap
openssh-client
openssh-keygen
openssh-server
openssh-sftp-server
openssl-util
px5g-mbedtls
qos-scripts
qrencode
rpcd
rpcd-mod-rrdns
samba4-libs
samba4-server
samba4-utils
socat
sysfsutils
sysstat
tar
tar_bzip2
tar_gzip
tar_xz
tc
tcpdump-mini
terminfo
uclibcxx
uhttpd
vnstat
vnstati
wget
wireguard
wireguard-tools
wsdd2
xz
xz-utils
zlib
zsh
```

</p>
</details>

### Module Configurations

<details><summary>Click to see</summary>
<p>


#### Samba 4
```
SAMBA4_SERVER_AVAHI
SAMBA4_SERVER_NETBIOS
SAMBA4_SERVER_VFS
```
#### NGINX (SSL)
```
NGINX_HEADERS_MORE
NGINX_HTTP_ACCESS
NGINX_HTTP_AUTH_BASIC
NGINX_HTTP_AUTOINDEX
NGINX_HTTP_BROTLI
NGINX_HTTP_BROWSER
NGINX_HTTP_CACHE
NGINX_HTTP_CHARSET
NGINX_HTTP_EMPTY_GIF
NGINX_HTTP_FASTCGI
NGINX_HTTP_GEO
NGINX_HTTP_GZIP
NGINX_HTTP_LIMIT_CONN
NGINX_HTTP_LIMIT_REQ
NGINX_HTTP_MAP
NGINX_HTTP_MEMCACHED
NGINX_HTTP_PROXY
NGINX_HTTP_REFERER
NGINX_HTTP_REWRITE
NGINX_HTTP_SCGI
NGINX_HTTP_SPLIT_CLIENTS
NGINX_HTTP_SSI
NGINX_HTTP_UPSTREAM_HASH
NGINX_HTTP_UPSTREAM_IP_HASH
NGINX_HTTP_UPSTREAM_KEEPALIVE
NGINX_HTTP_UPSTREAM_LEAST_CONN
NGINX_HTTP_USERID
NGINX_HTTP_UWSGI
NGINX_NAXSI
NGINX_PCRE
```
#### OpenSSL
```
OPENSSL_ENGINE
OPENSSL_PREFER_CHACHA_OVER_GCM
OPENSSL_WITH_ASM
OPENSSL_WITH_CHACHA_POLY1305
OPENSSL_WITH_CMS
OPENSSL_WITH_DEPRECATED
OPENSSL_WITH_EC
OPENSSL_WITH_ERROR_MESSAGES
OPENSSL_WITH_PSK
OPENSSL_WITH_SRP
OPENSSL_WITH_TLS13
```

</p>
</details>

### Libraries Configuration

<details><summary>Click to see</summary>
<p>

```
LIBCURL_COOKIES
LIBCURL_FILE
LIBCURL_FTP
LIBCURL_HTTP
LIBCURL_NO_SMB
LIBCURL_OPENSSL
LIBCURL_PROXY
LIBCURL_SSH2
LIBSODIUM_MINIMAL
LIBSSH2_OPENSSL
LUCI_SRCDIET
SOCAT_SSL
```

</p>
</details>

### Want to make your own automated builds?

* Use the `generate_build.sh` bash script provided.

### Module Requests?

* Please create an issue.

## Credits

* OpenWRT Community: https://openwrt.org/