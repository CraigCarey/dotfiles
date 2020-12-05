# My Base Docker

```bash
docker build -t base .

docker-compose up -d
sshpass -p root ssh-copy-id -o StrictHostKeyChecking=no root@localhost -p 2222
ssh -X root@localhost -p 2222

# or see run_docker.sh
```
