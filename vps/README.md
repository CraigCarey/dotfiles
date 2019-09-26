To check what IP address DNS is pointing at:

```bash
nslookup example.uk
```

To allow anyone on the remote server to ssh into the host machine:
```bash
# From the host machine
ssh -R 6022:localhost:22 example.uk

# From the server
ssh craig@localhost -p 6022

# Automatically restart on close:
autossh -NR 6022:localhost:22 root@example.uk
```

Using autossh (https://erik.torgesta.com/2013/12/creating-a-persistent-ssh-tunnel-in-ubuntu/):
```bash
cp autossh.conf /etc/init/autossh.conf            # modify IFACE
cp autossh_host.conf /etc/init/autossh_host.conf
cp autossh.hosts /etc/autossh.hosts               # modify hostname
```
