<p align="center">
  <img width="300" alt="plog_erd" src="https://github.com/christopher3810/plog_repo/assets/61622657/b2cb40fe-57ea-40f3-98b2-5138004e07a1">
</p>

### plog_chart

---

plog_chart는 PostgreSQL, MongoDB, Redis, Vault와 같은 백엔드 서비스를 포함하여 쿠버네티스 클러스터에 배포하기 위한 Helm 차트입니다. 

이 차트는 통합적인 환경을 구축하고 관리하는데 이용됩니다.

### Versioning

---

Helm 차트의 버전 관리는 `Chart.yaml` 파일 내의 `version 필드`를 통해 이루어집니다. 

이는 `SemVer 2 (Semantic Versioning 2)`를 따르며, 주요 변경 사항이 발생할 때마다 이 버전 번호를 업데이트해야 합니다.

버전 번호는 MAJOR.MINOR.PATCH의 형태로 이루어져 있으며, 각각의 세그먼트는 다음을 의미합니다:

`MAJOR`: 호환되지 않는 API 변경 사항이 생겼을 때 증가.

`MINOR`: 이전 버전과 호환되는 새로운 기능이 추가될 때 증가.

`PATCH`: 이전 버전과 호환되는 버그 수정이 이루어졌을 때 증가.

예시

>차트의 초기 버전을 1.0.0으로 설정하고, 새로운 기능이 추가되었을 때 1.1.0, 버그가 수정되었을 때 1.1.1로 업데이트할 수 있습니다.

### Usage

---

>Minikube 기준 M1 환경에서의 가이드 입니다.

Minikube에서 Ingress 컨트롤러를 활성화해야 합니다. 

```bash
minikube addons enable ingress
```

1. dependencies 업데이트

```bash
helm dependency update ./plog_chart
```

2. Helm 차트 install

```bash
helm install [RELEASE_NAME] ./plog_chart
```

3. Ingress 설정

```yaml
ingress:
  enabled: true
  hosts:
    - host: plog.ingress
```
이미 활성화는 해두었습니다.

4. 호스트 파일 설정

minikube ip 명령을 실행하여 Minikube 클러스터의 IP 주소를 얻습니다

```bash
minikube ip
```

5.Dns 설정
3번에서의 

```yaml
hosts:
    - host: plog.ingress
```
6. local dns에 plog.ingress를 dns 설정해줘야 합니다.

```bash
echo "$(minikube ip) plog.local" | sudo tee -a /etc/hosts
```
