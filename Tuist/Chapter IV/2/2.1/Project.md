# Project.swift

내장된 함수는 아래와 같습니다.

- 프로퍼티
    - `**name**`
    - `**organizationName**`
    - `**options**`
    - `**packages**`
    - `**targets**`
    - `**schemes**`
    - `**settings**`
    - `**fileHeaderTemplate**`
    - **`additionalFiles`**
    - `**resourceSynthesizers**`
    - `**containsExternalDependencies**`
- 초기화
    - `**init(name:organizationName:options:packages:settings:targets:schemes:fileHeaderTemplate:additionalFiles:resourceSynthesizers:)**`

```swift
public struct Project: Codable, Equatable
```

위는 프로젝트의 내부를 뜯은 모습니다.

프로젝트 매니페이스는 Project.swift 매니페스트 파일에 정의해야합니다. 매니페이스트는 프로젝트를 설명하는 데 사용할 수 있는 모든 함수를 사용할려면 ProjectDescription을 import 해야합니다.

아래는 프로젝트의 기본적인 예시입니다.

```swift
import ProjectDescription

let project = Project(
    name: "MyProject",
    organizationName: "MyOrg",
    targets: [
        Target(
            name: "App",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.App",
            infoPlist: "Config/App-Info.plist",
            sources: ["Sources/**"],
            resources: [
                "Resources/**",
                .folderReference(path: "Stubs"),
                .folderReference(path: "ODR", tags: ["odr_tag"])
            ],
            headers: .headers(
                public: ["Sources/public/A/**", "Sources/public/B/**"],
                private: "Sources/private/**",
                project: ["Sources/project/A/**", "Sources/project/B/**"]
            ),
            dependencies: [
                .project(target: "Framework1", path: "../Framework1"),
                .project(target: "Framework2", path: "../Framework2")
            ]
        )
    ],
    schemes: [
        Scheme(
            name: "App-Debug",
            shared: true,
            buildAction: .buildAction(targets: ["App"]),
            testAction: .targets(["AppTests"]),
            runAction: .runAction(executable: "App")
        ),
        Scheme(
            name: "App-Release",
            shared: true,
            buildAction: .buildAction(targets: ["App"]),
            runAction: .runAction(executable: "App")
        )
    ],
    additionalFiles: [
        "Dangerfile.swift",
        "Documentation/**",
        .folderReference(path: "Website")
    ]
)
```

## 설명

### **`name`**

```swift
public let name: String
```
<img width="626" alt="스크린샷 2024-05-12 오후 9 09 21" src="https://github.com/jjunhaa0211/Tuist-Junha/assets/102890390/69666b0b-e85d-4a57-8c4a-c663a8f01ff4">

프로젝트의 이름을 정할 수 있습니다. 여기서 만든 파일이 xcode의 프로젝트의 파일이름이 됩니다.

### **`organizationName`**

```swift
public let organizationName: String?
```

xocde에서 저작권으로 사용하는 조직의 이름입니다.

주로 workspaceName의 이름을 추가할 때 주로 사용합니다.

### **`options`**

```swift
public let options: Options
```

특정 테스트 작업에 대한 옵션을 정의할 떄 사용합니다.

위는 프로젝트에 옵션을 추가할 경우 사용하는데 아직 이해가 잘 안되시죠..?

```swift
public static func options(language: ProjectDescription.SchemeLanguage? = nil,
                           region: String? = nil, 
                           coverage: Bool = false, 
                           codeCoverageTargets: [ProjectDescription.TargetReference] = []
                           ) -> ProjectDescription.TestActionOptions
```

1. `**language**`: 테스트를 실행하는 데 사용되는 언어를 나타내는 곳입니다. 주로 ProjectDesciption.SchemeLanguage 유형의 선택적 매개변수입니다.
    1. `doubleLengthPseudoLanguage`: 가상 언어는 문자열을 두 배의 길이로 확장하여 텍스트 레이아웃 및 UI 테스트를 수행하는데 사용될 수 있습니다.
    2. `rightToLeftPseudoLanguage`: 오른쪽에서 왼쪽으로 텍스트를 표시하는 언어 시뮬레이션으로 사용됩니다. (아랍어, 히브리어)
    3. `accentedPseudoLanguage`: 각 문자에 액센트를 추가하여 텍스트의 모습을 변형시키는데 사용됩니다. 이를 통해 텍스트 렌더링 및 문자열 처리와 관련된 문제를 확인할 수 있습니다.
    4. **`boundedStringPseudoLanguage`**: 문자열의 최대 길이를 제한하는 가상 언어로, 텍스트 자르기 및 뷰 레이아웃에 관련된 문제를 테스트하는 데 사용될 수 있습니다.
    5. **`rightToLeftWithStringsPseudoLanguage`**: 오른쪽에서 왼쪽으로 텍스트를 표시하는 언어와 함께 문자열을 사용하는 시나리오를 시뮬레이션하는 데 사용됩니다.
2. `**region**`: 테스트 실행하는데 사용되는 지역을 나타내는 문자열의 선택적 매개변수입니다.
3. `coverage`: 테스트 커버리지를 수집해야하는지 여부를 나타내는 Bool 매개변수입니다. 기본값은 false입니다.
4. `**codeCoverageTargets**`: 코드 커버리지 정보를 수집해야하는 테스트 대상의 목록을 나타내는 ProjectDescription.TargetReference 배열의 선택적 매개 변수입니다.

이 함수는 **`ProjectDescription.TestActionOptions` 형식의 옵션을 반환합니다. 옵션은 테스트 작업에 대한 설정을 캡슐화하는데 사용됩니다.**

정적으로 선언되어 있으므로 인스턴스를 만들필요 없습니다.
하지만 **`TestActionOptions.options()` 를 호출하여 옵션을 사용할 수 있습니다.**

### `**Package**`

```swift
public let packages: [Package]
```

프로젝트에서 사용하는 Swift 패키지들을 추가할 수 있습니다.

주로 아래와 같은 SPM과 같은 package를 추가할 수 있습니다.

```swift
.remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMinor(from: "5.0.0")),
```

### **`targets`**

```swift
public let targets: [Target]
```

프로젝트의 대상인데요… 이렇게 설명하면 어렵기 때문에 다음에 세부적으로 알려드리겠습니다.

> target 링크 바로가기 (준비중)
> 

### **`schemes`**

```swift
public let schemes: [Scheme]
```

프로젝트의 사용자 정의 스키마입니다. 각 대상에 대한 기본 스키마는 기본적으로 생성되지만 만약 div라던가 qa라던가 그런거 만들때 별도아 추가를 해줘야합니다.

아래 코드와 같은 느낌으로 추가해주시면 됩니다.

```swift
    static let appSchemes: [Scheme] = [
        .init(
            name: "\(Environment.workspaceName)-QA",
            shared: true,
            buildAction: .buildAction(targets: ["\(Environment.workspaceName)"]),
            runAction: .runAction(configuration: "QA"),
            archiveAction: .archiveAction(configuration: "QA"),
            profileAction: .profileAction(configuration: "QA"),
            analyzeAction: .analyzeAction(configuration: "QA")
        )
]
```

### **`settings`**

```swift
public let settings: Settings?
```

프로젝트의 빌드 설정 및 구성을 하는 것입니다.

### **`fileHeaderTemplate`**

```swift
public let fileHeaderTemplate: FileHeaderTemplate?
```

주로 xcode의 내장 파일 템플릿에 대한 사용자 정의 파일 헤더 템플릿입니다.
쉽게 생각해서 파일을 생성할 때 사용자가 자동으로 사용자 지정 파일을 헤더를 추가할 수 있도록 도와줍니다.

이때 **`FileHeaderTemplate` 은 파일 헤더를 나타내는 열거형입니다.**

- file: 파일에 저장된 템플릿을 로드하는 데 사용됩니다.
- string: 케이스는 인라인 문자열로 템플릿을 정의합니다.

이때 **`FileHeaderTemplate`** 은 **`Codable`**, **`Equatable`**, **`ExpressibleByStringInterpolation`** 프로토콜을 채택하고 있어서 JSON과 같은 외부 표현으로 인코딩 및 디코딩이 가능합니다.

**`encode(to:)`**와 **`init(from:)`** 메서드는 **`Codable`** 프로토콜을 준수하기 위한 것으로, 값의 인코딩 및 디코딩을 처리합니다.

### **`additionalFiles`**

```swift
public let additionalFiles: [FileElement]
```

프로젝트의 추가파일로 대산의 추가파일은  

프로젝트의 주요 소스 코드 이외의 추가 파일을 추가할 수 있습니다. 설정 및 빌드 프로세스에 필요한 파일이거나, 리소스 파일 등을 포함할 수 있습니다.

프로젝트 설정 파일이나 리소스 파일은 주로 추가 파일로 추가합니다.

**`additionalFiles`** 속성은 **`ProjectDescription.FileElement`** 타입의 배열로 정의되어있습니다.

### **`resourceSynthesizers`**

```swift
public let resourceSynthesizers: [ResourceSynthesizer]
```

프로젝트의 리소스 합성기로 리소스에 대한 액세서를 생성합니다.

리소스 합성기란 Tuist에서 리소스를 자동으로 생성하거나 변환하기 위해 사용합니다. 보통 프로젝트 빌드 단계에서 발생하는 작업 중 하나입니다.

예를 들어서, 이미지 리소스의 경우, 리소스 합성기는 이미지 파일을 받아들여서 필요한 크기로 자동으로 조정하거나, 이미지 파일에 대한 코드를 생성하여 코드로 리소스에 접근할 수 있도록 합니다.

### **`containsExternalDependencies`**

```swift
public var containsExternalDependencies: Bool
```

프로젝트에 외부 종속성을 사용하는 대상이 포함되어 있는지 여부를 나타냅니다.

### 초기화 메소드

> 프로젝트 기본 초기화 메소드 입니
> 

```swift
public init(
    name: String,
    organizationName: String? = nil,
    options: Options = .options(),
    packages: [Package] = [],
    settings: Settings? = nil,
    targets: [Target] = [],
    schemes: [Scheme] = [],
    fileHeaderTemplate: FileHeaderTemplate? = nil,
    additionalFiles: [FileElement] = [],
    resourceSynthesizers: [ResourceSynthesizer] = .default
)
```
