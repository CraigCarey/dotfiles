## General Stuff

### Enable static IP
```bash
sudo cp interfaces /etc/network/
sudo ip a flush <DEVICE>
sudo systemctl restart networking.service
```

### Enable auto-mount
```bash
sudo cp fstab /etc/
```

### Prohibit SSH password access
```bash
sudo cp sshd_config /etc/ssh/
sudo systemctl restart sshd.service
```

### Firewall
```bash
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw enable
```

## Pi-hole
### Turn off systemd-resolve
```bash
sudo cp resolved.conf /etc/systemd/
sudo systemctl disable systemd-resolved.service
sudo service systemd-resolved stop
```

## Remote Desktop

### Install x2go server
```bash
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:x2go/stable
sudo apt-get update
sudo apt-get install x2goserver x2goserver-xsession x2gognomebindings
```

## NextCloud
```bash
cd services
fill in `MYSQL_ROOT_PASSWORD` in `docker-compose.yml`
docker-compose up -d
```
