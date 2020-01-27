# Reverse SSH Tunneling

To check what IP address DNS is pointing at:

```bash
nslookup example.uk
```

## On the host (remote)
```bash
ssh -R 6022:localhost:22 craig@example.uk
```

### Add to /etc/rc.local

```bash
su craig -c '/usr/bin/autossh -fNR 6022:localhost:22 -i /home/craig/.ssh/id_rsa craig@example.uk'

exit 0
```

## On the local (server)

```bash
ssh craig@localhost -p 6022
```

## Leaving here for reference

To allow anyone on the server to ssh into the host machine:
```bash
# From the host machine
ssh -R 6022:localhost:22 example.uk

# From the server
ssh craig@localhost -p 6022

# Automatically restart on close:
autossh -NR 6022:localhost:22 craig@example.uk
```

Using autossh (https://erik.torgesta.com/2013/12/creating-a-persistent-ssh-tunnel-in-ubuntu/):
```bash
cp autossh.conf /etc/init/            # modify IFACE
cp autossh_host.conf /etc/init/
cp autossh.hosts /etc/                # modify hostname
```
