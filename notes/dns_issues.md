# Fixing DNS issues on Ubuntu

Edit `/etc/systemd/resolved.conf` and change/add this line:

`DNS=1.1.1.1`

(I'm using CloudFlare's DNS server here.)

Then change the `/etc/resolv.conf` symlink like this:

`sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf`

Then reboot
