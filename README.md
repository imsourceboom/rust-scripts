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

1. docker 포함 사전 셋업

```
cd $HOME/rust-scripts/setup
./pre-setup.sh
```

- Docker 특성상 권한 부여를 하더라도 재접속이 필요함

2. Rust node 셋업

```
cd $HOME/rust-scripts/setup
./setup.sh
```

3. $HOME/keys 디렉토리에 키파일들 셋팅

- validator.addr, msig.keys.json, depool.addr, depool.keys.json 등

4. key 파일들 rnode container로 복사

```
cd $HOME/rust-scripts/setup
./keysCopy.sh
```

5. election 참가 및 validation 확인 후 monitering 셋업

```
cd $HOME/rust-scripts/setup
./moniteringSetup.sh
```

- 스크립트 실행 전 monitorring 디렉토리안의 .env 파일 생성 후 telegram api 와 chat id 값 입력

6. monitoring 제어

```
# 프로세스 확인 - 모니터링 프로세스 name: monitoring
pm2 ls

# 시작
pm2 start [process id]

# 중지
pm2 stop [process id]

# 재시작 - 모니터링 관련 스크립트가 업데이트 되었을 때 실행
pm2 restart [process id]
```
