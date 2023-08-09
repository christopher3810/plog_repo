<p align="center">
  <img width="300" alt="plog_erd" src="https://github.com/christopher3810/plog_repo/assets/61622657/565160d5-e31c-4694-9488-a6656d397859">
</p>

<h2 align="center">Plog</h2>

<p align="center">
  Your Personalized Blog.<br>
</p>

<p align="center">
  <!-- 기본 뱃지들 -->
  <img src="https://img.shields.io/github/stars/christopher3810/plog_repo?style=social">
  <img src="https://img.shields.io/github/issues/christopher3810/plog_repo">
  <img src="https://img.shields.io/github/issues-pr/christopher3810/plog_repo">
  <img src="https://img.shields.io/github/license/christopher3810/plog_repo">
</p>

<p align="center">
  <!-- 추가적인 뱃지들 -->
  <img src="https://img.shields.io/github/last-commit/christopher3810/plog_repo">
  <img src="https://img.shields.io/github/forks/christopher3810/plog_repo?style=social">
  <img src="https://img.shields.io/github/languages/count/christopher3810/plog_repo">
  <img src="https://img.shields.io/github/release/christopher3810/plog_repo">
</p>

### 주요 기능

1. 글 작성 및 조회
2. 댓글 기능
3. 이모지 반응
4. 태그 기능
5. 소셜 로그인 (Google, Kakao)
6. 프로필 편집

### 사용자 시나리오
1. 사용자는 구글 또는 카카오톡 계정으로 로그인합니다.
2. 로그인한 사용자는 대시보드에서 글을 조회하거나, 특정 토픽이나 태그로 글을 검색할 수 있습니다.
3. 사용자는 특정 글을 클릭하여 내용을 확인하고, 댓글을 작성하거나 이모지로 반응할 수 있습니다.
4. 사용자는 자신의 프로필을 편집하여 닉네임, 이메일, 프로필 사진, Github 링크, SNS 링크, 블로그 링크 등을 업데이트할 수 있습니다.
5. Admin 권한을 가진 사용자는 모든 사용자의 글을 수정/삭제할 수 있습니다.
6. 글의 공개 범위 설정(공개, 친구에게만 공개 등)이 가능합니다.
7. 친구 그룹별로 글의 공개 범위를 설정할 수 있습니다.
8. 친구 그룹에 초대 받은 사용자는 알림을 받습니다.
9. 각 사용자는 친구 그룹을 관리할 수 있습니다.
10. 글 작성 시 공개 범위를 선택하고, 친구 그룹의 공개 범위도 설정할 수 있습니다.
11. 모든 사용자는 본인이 작성 한 글만 수정, 삭제할 수 있습니다.
12. 계정을 탈퇴할 경우 comment의 유저정보는 탈퇴한 회원입니다 라고 나오며 해당 유저가 소속된 group에서 자동으로 전부 제거됩니다.
13. 계정 탈퇴시 작성한 글은 전부 삭제됩니다.

### 데이터 베이스 설계
---
[데이터 베이스 설계](https://github.com/christopher3810/plog_repo/blob/master/DATABASE_DESIGN.md)

### 로컬 클러스터 설계
---
[로컬클러스터 설계](https://github.com/christopher3810/plog_repo/blob/master/Clustering%20Arch.md)

### Helm Chart
---
[Helm Chart](https://github.com/christopher3810/plog_repo/tree/master/HelmChart)

### Spring Web Service
---
[Spring Web Service](https://github.com/christopher3810/plog_repo/tree/master/plog-webapp)
