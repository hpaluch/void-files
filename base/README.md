# Void Linux files

Here are my base configuration files for Void Linux. See also:
- https://voidlinux.org/
- https://github.com/hpaluch/hpaluch.github.io/wiki/VoidLinux

# Firewall

Iptables seems to be better documented on https://docs.voidlinux.org/config/network/firewalls.html
so I'm using configuration for them.

To setup my iptables rules do this:
```shell
# as root in this (git repo) directory:
cp -v etc/iptables/* /etc/iptables/

# activate manually rules to verify that there is no error:
iptables-restore -w 3 /etc/iptables/iptables.rules
iptables-save # dumps tables on stdout
ip6tables-restore -w 3 /etc/iptables/ip6tables.rules
ip6tables-save # dumps tables on stdout

# enable both iptables and ip6tables on startup:
cd /etc/runit/runsvdir/default
ln -s /etc/sv/ip6tables 
ln -s /etc/sv/iptables
```

Enabling syslog:
- described on: https://docs.voidlinux.org/config/services/logging.html
  ```shell
  # run as root:
  xbps-install socklog-void
  cd /etc/runit/runsvdir/default
  ln -s /etc/sv/socklog-unix
  ln -s /etc/sv/nanoklogd
  # manual start without reboot
  sv up socklog-unix
  sv up  nanoklogd
  ```
- logs are stored in `/var/log/socklog/`
- to display current non-empty logs filenames try:
  ```shell
  sudo find /var/log/socklog/ -type f -name current  -size +0 -exec ls -l {} \;
  ```

My favourite packages:
```shell
xbps-install -u tmux mc curl wget vim vim-colorschemes lynx pinfo # from my wiki
xbps-install -u ncdu2 btop git lsof # more tools
xbps-install -u bind-utils # nslookup
xbps-install -u net-tools  # netstat
```

For X11/Xfce packages please see my wiki
on: https://github.com/hpaluch/hpaluch.github.io/wiki/VoidLinux


