# My Base Docker

```bash
docker build -t base .

docker-compose up -d
sshpass -p root ssh-copy-id -o StrictHostKeyChecking=no root@localhost -p 2222
ssh -X root@localhost -p 2222

# or see run_docker.sh
```


## Publishing to GitHub Packages
Go to https://github.com/settings/tokens and generate a token scoped for pushing packages. Call it docker.

```bash
docker build -t ghcr.io/craigcarey/dotfiles/base .
export CR_PAT=<token generated above>
echo $CR_PAT | docker login ghcr.io -u craigcarey --password-stdin
docker push ghcr.io/craigcarey/dotfiles/base
```
