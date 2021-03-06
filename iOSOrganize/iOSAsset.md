# iOS Asset

- **에셋 카탈로그**

---

어플리케이션에 사용될 다양한 에셋을 관리, 이를 에셋 카탈로그라 일컫음.

- **구성**

    Groups: 그룹은 한 개이상의 또 다른 그룹이나 에셋을 가질 수 있음

    Assets: 에셋은 한 가지 타입의 관련된 속성과 파일들의 집합을 나타냄.

    Assets name: 에셋에 접근하기 위해 개발자가 정의한 문자열

    Asset files: 선택한 에셋의 데이터 파일 또는 리소스

    Attributes: 속성은 선택한 그룹, 에셋, 에셋파일의 속성을 나타냄

    Asset variations: 선택된 하나의 조각(에셋 파일들의 집합)을 나타냄. 이 조각은 같은 속성 값(Value)가 적용되는 단위.

- **콘텐츠**

    Folders: 에셋 카탈로그 폴더는 다른 그룹 폴더나 에셋 폴더를 포함할 수 있음. 파일시스템의 폴더 이름은 대체적으로 확장자를 갖지 않음. 하지만 에셋 카탈로그 폴더는 위의 그림과 같이 해당 에셋 타입의 확장자가 자동으로 붙는다.

    JSON files: .json 확장자 파일로써 속성에 대한 정보를 포함하고 있음.

    Content files: 콘텐츠 파일은 리소스 파일을 나타낸다.

- **에셋 카탈로그 폴더 구성**

    Asset catalog folder: 에셋 카탈로그 폴더는 모든 폴더와 파일들을 가지고 있음.

    Group folder: 그룹 폴더는 다른 그룹 폴더나 에셋 폴더를 갖고 있음.

    Asset folder: 에셋 폴더는 리소스 파일들을 갖고 있음.

[에셋 카탈로그 타입](https://www.notion.so/cf59f3124b3e4d108e8b0ab3dcf16caa)

- **앱 시닝(app thinning)**

---

 앱 시닝이란 애플리케이션이 디바이스에 설치될 때 앱 스토어와 운영체제가 그 디바이스에 설치될 때 앱 스토어와 운영체제가 그 디바이스의 특성에 맞게 설치하도록 하는 설치 최적화 기술을 의미한다. 이를 통해 애플리케이션의 설치용량을 최고화하고 다운로드의 속도를 향상시킬 수 있음. 앱 시닝의 기술 구성요소는 슬라이싱(slicing), 비트코드(bitcod), 주문형 리소스(on-demand resource)가 있음.

**슬라이싱(slicing)**

---

 슬라이싱은 애플리케이션이 지원하는 다양한 디바이스에 대한 여러 조각의 애플리케이션 번들을 생성하고 디바이스에 알맞은 조각을 전달하는 기술. 개발자가 애플리케이션의 전체 버전을 iTunes Connect에 업로드하게 되면, 앱 스토어에는 각 디바이스 특성에 다양한 버전의 조각들이 생성된다. 사용자가 애플리케이션을 설치할 때 전체 버전이 아닌 슬라이싱된 조각들 중 사용자의 디바이스의 가장 적합한 조각이 다운로드되어 설치됨. 에셋 카탈로그에서 관리하는 이미지들은 자동으로 적용이 된다.

- iTunes Connect란 개발자가 앱 스토어에 판매할 애플리케이션을 제출하고 관리할 수 있도록 도와주는 웹 기반 도구.