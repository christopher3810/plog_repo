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

버전 번호는 MAJOR.MINOR.PATCH의 형태로 이루어져 있으며, 각각의 세그먼트는 다음을 의미합니다.

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

그리고 helm repository 도 추가해야 합니다.
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo update
```

1. dependencies 업데이트

```bash
helm dependency update ./${helmChartFolderPath}
```

2. Helm 차트 install

`helm install` 명령은 차트 디렉터리나 패키지된 `.tgz` 파일을 대상으로 함.


```bash
helm install [RELEASE_NAME] ./${helmChartFolderPath}
```

3. Ingress 설정

```yaml
ingress:
  enabled: true
  hosts:
    - host: plog.ingress
```
이미 활성화는 해두었습니다.

4.local dns에 plog.ingress를 dns 설정.

```yaml
hosts:
    - host: plog.ingress
```
3 번에서의 host 정보를 가져와서 minikube ip와 dns 매핑을 해줍니다.

```bash
echo "$(minikube ip) plog.local" | sudo tee -a /etc/hosts
```

### m1 환경에서 mongodb 설정에 대해서

---

>m1 mac 환경에서 bitnami/mongd 를 지원하지 않는 것 같습니다.

```yaml
#values.yaml
mongodb:
  image:
    repository: mongo
    tag: 6.0.4-jammy
  persistence:
    mountPath: /data/db

  #...

  securityContext:
    runAsUser: 999
    fsGroup: 999
```

arm64 지원 이미지를 별도 기입해야 했습니다.

persistence /moutPath 경로는 의존적이라 정해진 대로 기입 해줍니다.

securityContext 에서 fsGroup 정보를 999 로 줘서 pvc 에서 초기 mongo 구동시 Lock.file을 생성 할 수 있도록합니다.

추후 window 환경시 해당 설정 값들을 지우고 그냥 chart.yaml 에서 의존성 받아서 실행하면 구동 될것 같습니다.
