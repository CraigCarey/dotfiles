# My Base Docker

```bash
docker build -t base .

docker-compose up -d

ssh docker-base # see ../ubuntu/hosts.append

docker build -t gst -f Dockerfile.gst .
ssh docker-gst


# or see run_docker.sh
```


## Publishing to GitHub Packages
Go to https://github.com/settings/tokens and generate a token scoped for pushing packages. Call it docker.

```bash
docker build -t ghcr.io/craigcarey/dotfiles/base .
export CR_PAT=<token generated above>
# or
source ~/.ssh/ghcr.token

echo $CR_PAT | docker login ghcr.io -u craigcarey --password-stdin
docker push ghcr.io/craigcarey/dotfiles/base
```
