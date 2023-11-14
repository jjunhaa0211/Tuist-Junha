# Tuist_CleanArchitecture_Template
![graph](https://github.com/jjunhaa0211/Tuist_CleanArchitecture_Template/assets/102890390/e0c59665-46fb-4fbf-a4a6-2b9d34eb34fd)

## Tuist 애플리케이션 아키텍처

### 원칙

1. **유지보수 용이성**
   - 애플리케이션 구조를 잘 분리하고 의존성을 제한하여 개발 및 유지보수가 용이해집니다.

2. **테스트 용이성**
   - 의존성을 분리하여 모듈화하면, 단위 테스트와 인수 테스트 등 테스트를 수행하기 쉬워집니다.

3. **모듈의 독립성 보장**
   - 모듈을 독립적으로 개발하여 향후 예측할 수 없는 문제에 대처하기 좋아집니다.

4. **개방/폐쇄 원칙**
   - 클린 아키텍처 구조는 소프트웨어의 개방/폐쇄 원칙을 따릅니다. 모듈 간의 인터페이스를 잘 정의하고, 모듈 내부를 수정하지 않고도 기능을 확장할 수 있습니다.

5. **높은 수준의 유연성**
   - 일관성 있고 탄도 있는 디자인을 통해 새로운 요구 사항을 빠르게 반영할 수 있습니다.

### Tuist 구조

- **APP-iOS**
  - 앱 모듈로, Data와 Presentation 모듈을 사용합니다.

- **Core**
  - 코어 모듈로, 공유되는 코드와 ThirdPartyLib를 사용합니다.

- **Data**
  - 데이터 모듈로, APPNetwork와 Domain 모듈을 사용합니다.

- **Domain**
  - 도메인 모듈로, 비즈니스 로직을 담당하며 Core 모듈을 사용합니다.

- **APPKit**
  - UI 관련 코드를 담는 모듈로, Core 모듈을 사용합니다.

- **APPNetwork**
  - 네트워크 모듈로, Core 모듈을 사용합니다.

- **ThirdPartyLib**
  - 외부 라이브러리를 모아둔 모듈로, SnapKit, Kingfisher, Then, Moya, RxBlocking, RxCocoa, RxSwift, RxMoya 등의 라이브러리를 사용합니다.

- **Presentation**
  - 프레젠테이션(화면) 모듈로, Domain과 APPKit 모듈을 사용합니다.
