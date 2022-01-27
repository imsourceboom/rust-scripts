# Rust Node Management Scripts

- user 계정 생성 후 sudo 권한 부여 (example: username)

```
sudo adduser username
sudo usermod -aG sudo username
```

- ssh 셋팅

```
mkdir -p $HOME/.ssh
echo "your ssh-rsa key" >> $HOME/.ssh/authorized_keys
sudo chmod 700 $HOME/.ssh
sudo chmod 600 $HOME/.ssh/authorized_keys
sudo cp -r $HOME/.ssh /home/username
sudo chown -R username:username /home/username/.ssh
```

---

> 생성한 계정으로 접속

rust-scripts/scripts/setup

1. docker 포함 사전 셋업

```
pre-setup.sh
```

- Docker 특성상 권한 부여를 하더라도 재접속이 필요함

2. Rust node 셋업

```
setup.sh
```

3. key 파일들 rnode container로 복사

```
keysCopy.sh
```

4. election 참가 및 validation 확인 후 monitering 셋업

```
moniteringSetup.sh
```

- 스크립트 실행 전 monitorring 디렉토리안의 .env 파일 생성 후 telegram api 와 chat id 값 입력
