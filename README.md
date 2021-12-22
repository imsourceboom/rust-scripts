# Rust Node Management Scripts

- user 계정 생성 후 sudo 권한 부여
- user 계정 접속 후 ssh 셋팅
- user 홈 디렉토리에 keys 디렉토리 생성

---------------------------------------

rust-scripts/scripts/setup
1. user 계정 sudo 명령어 시 password 제외
```
noPasswd.sh
```

2. timezone 변경
```
timezone.sh
```

3. docker 설치
```
dockerSetup.sh
```
* docker 설치 후 서버 재접속

4. $HOME 디렉토리에 rustnet.ton.dev 설치
```
git clone -b mainnet https://github.com/tonlabs/rustnet.ton.dev.git
```
* rustnet.ton.dev/scripts 디렉토리의 env.sh 파일의 DEPOOL_ENABLE="yes"로 변경 후 배포 진행

5. rustnet.ton.dev deploy 완료 후 tools 디렉토리 셋업
```
toolsSetup.sh
```

6. keys 디렉토리 안의 파일들 네이밍 작업
```
keysRename.sh
```

7. key 파일들 rnode container로 복사
```
keysCopy.sh
```
* key 복사 후 일정 시간 지난 뒤에 5번을 진행하면 tonos-cli.conf.json 파일 업데이트 가능

8. election 참가 및 validation 확인 후 monitering 셋업
```
moniteringSetup.sh
```
* 스크립트 실행 전 .env 파일 생성 후 telegram api 와 chat id 값 입력
