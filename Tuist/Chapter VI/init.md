# init
> tuist edit
> 
- Tuist init을 하면 템플릿에서 프로젝트를 초기화 할 때 사용합니다.

Tuist init 사용시에 아래와 같은 폴더가 생성되며 Tuist 세팅을 자동으로 맞추어줍니다.

<img width="818" alt="스크린샷 2024-03-16 오후 4 01 27" src="https://github.com/jjunhaa0211/Tuist-Junha/assets/102890390/bcb63196-0013-4337-92e7-dd912584865b">

- gitignore 파일이 기본 생성되며 기본적인 이그노 세팅을 전부 해줍니다.
    - (여러분이 Tuist 프로젝트를 깃허브에서 많이 보았다면 주로 xcworkspace를 자주 보시지 못했을 텐데 이는 개발자들간의 협업중 컨플리트 방지를 위해서 gitignore에 기본 세팅이 되어있어서 generate를 하지 않으면 추가되지 않습니다.)
- 기본적인 Plugins가 하나 생성됩니다.
- 그리고 Module 만들어보라고 Project.swift도 있는 것이 보이고요~
- Targets 안에도 여러 예시 파일이 생성됩니다.
- Tuist 안에는 Config와 Project+Templates도 주네요….
    - (제가 처음 할때는 이렇게 친절하지 않았는데….)

이러한 구성 요소가 추가되게 하는 것이 tuist init입니다!!
