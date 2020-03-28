## Docker-Certbot

### 起因

+ 为方便获取证书和续订证书，故封装了`Docker`镜像。

### 使用方法

#### 构建镜像

+ 本地构建镜像, 先`clone`仓库到本地, 再构建镜像:

```bash
git clone https://github.com/YuXiaoCoder/docker-certbot.git
cd docker-certbot/
docker build --no-cache --tag docker-certbot .
```

#### 获取证书

```bash
mkdir -p /etc/letsencrypt

docker run -it \
  --rm \
  -v /data/www:/data/www \
  -v /etc/letsencrypt:/etc/letsencrypt \
  docker-certbot \
  certonly --webroot -w /data/www -d www.xiaocoder.com --email xiao.950901@gmail.com
```

#### 续订证书

```bash
docker run -d \
  --name "certbot" \
  -v /data/www:/data/www \
  -v /etc/letsencrypt:/etc/letsencrypt \
  docker-certbot renew
```

+ 重复续订：

```bash
docker restart certbot
```

***
