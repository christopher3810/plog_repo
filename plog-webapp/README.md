<p align="center">
  <img width="300" alt="plog_erd" src="https://github.com/christopher3810/plog_repo/assets/61622657/1ada54e9-f72b-42c2-89f5-c5099e74c046">
</p>

## Spring Backend Service

### Minikube DB 들 과의 연결 설정

1. NodePort 서비스 적용

[Database-NodePort.yaml 위치](https://github.com/christopher3810/plog_repo/tree/master/Database-NodePort)

터미널에서 아래의 명령을 실행하여 databases-nodeport.yaml 파일을 적용합니다.

```bash
kubectl apply -f databases-nodeport.yaml
```
2.Minikube IP 주소 환경 변수로 설정

Minikube의 IP 주소를 환경 변수로 등록.

```bash
export MINIKUBE_IP=$(minikube ip)
```

application.yaml 값이

```yaml
spring:
  r2dbc:
    url: r2dbc:postgresql://${MINIKUBE_IP}:32017
    username: postgres
    password: 1234
  data:
    mongodb:
      uri: mongodb://${MINIKUBE_IP}:32018/plog_files
    redis:
      host: ${MINIKUBE_IP}
      port: 6379
  datasource:
    url: jdbc:${MINIKUBE_IP}://localhost:32017
    username: postgres
    password: 1234
  flyway:
    baseline-on-migrate: true
    locations: classpath:db/migration
```

위와 같아 환경 변수를 참조