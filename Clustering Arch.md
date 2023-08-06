Spring Boot Service를 제외하고 떠야 하는 어플리케이션 종류

1. Postgres
2. MongoDB
3. Redis
4. Vault

> Grafana , Prometheus 보류(시스템 메트릭 모니터링)

별도의 cluster 설정으로 관리하자.

### DockerCompose 를 활용해서 Container 클러스터링

장점

1. **단순성**
   Docker Compose는 YAML 파일 형식을 사용하여 여러 컨테이너의 설정을 정의하고 관리.
    이는 복잡한 설정을 쉽게 이해하고 유지 관리 할 수 있게 함.

2. **개발환경에 최적화**
   Docker Compose는 로컬 개발환경에서 여러 컨테이너를 함께 실행하는데 특화되어 있음.
    개발자가 필요한 모든 서비스를 하나의 compose 파일에 정의하면, 한 번의 명령으로 모든 서비스를 시작하거나 중지할 수 있음.
  
3. **프로덕션 배포용도 가능**
   
   Swarm mode를 사용하면 Docker Compose를 통해 컨테이너를 프로덕션 환경에 배포할 수 있음.

단점

1. **기능 제한성**
   Docker Compose는 단일 호스트에서 여러 컨테이너를 실행하는 데 초점을 맞추고 있어, 클러스터 전체 관리 기능이 미흡.
    
2. **대규모 분산 애플리케이션에 부적합**
   Docker Compose는 대규모 분산 애플리케이션의 관리와 운영에 적합하지 않음.

### MiniKube 를 활용해서 Local 클러스터링

장점

1. **통합 환경**
   Minikube는 로컬에서 전체 기능의 싱글 노드 Kubernetes 클러스터를 제공 .
   이를 통해 개발자가 Kubernetes에서 애플리케이션을 개발하고 테스트할 수 있음.
    
2. **Kubernetes 기능 활용**
   Minikube를 사용하면 Kubernetes의 모든 기능을 활용할 수 있습니다. 이는 서비스 디스커버리, 로드 밸런싱, 자동 복구 등을 포함.
    
3. **Helm 및 K9s 통합**
   Helm을 사용하면 Kubernetes 애플리케이션을 패키징하고 배포하는 것이 간편해짐.
    K9s는 클러스터를 시각적으로 관리하고 모니터링하는데 유용.

4. Cloud Native 환경에 대한 학습 가능.
   CNCF 인프라 환경에대한 학습 가능.

단점

1. **상대적 복잡성**
   Docker Compose에 비해 Kubernetes 환경은 복잡성이 상대적으로 높음.
    초기 설정에 시간이 더 필요할 수 있음.
    
2. **리소스 요구량**
   Minikube는 싱글 노드 Kubernetes 클러스터를 실행하기 때문에, 상대적으로 높은 시스템 리소스를 요구함.
    
### 결론

Minikube, helm chart 기반의 클러스터 구성으로 생성.

시각화는 open lens 대신 k9s를 활용.

>추후 구현 고려 사항. 우선 순위는 낮음. \
>Jeager, Grafana, Prometheus 를 활용한 로깅 처리. \
>Spring boot 를 pod 내부에 통합화 하여 분산 처리. \
>fluent bit 을 활용한 log 중앙 처리 및 시각화.

사유

1. 확장성 고려(분산처리 환경, k3s, kubernetes 환경 으로 이식 등.)
2. CNCF 인프라 구조에 대한 학습을 추가로 할 수 있음.

개발 os 환경

m1 mac os 집 노트북

### 간단 시각화
---

```text
User
  |
  | HTTP requests
  V
React Web UI
  |
  | REST API calls
  V
Spring Boot Services
  |
  | communicates with
  V
Minikube Cluster
  |
  | manages
  V
----------------------------------------------
|            |          |          |        
V            V          V          V        
Postgres   MongoDB   Redis       Vault        
(Command)  (Event)   (Cache)     (Secret Mgmt) 
----------------------------------------------
  |
  | managed via
  V
Helm
  |
  | visualized by
  V
k9s
```
