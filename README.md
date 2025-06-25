Flutter를 이용하여 ios Front와 약간의 backend를 진행

프론트의 경우 현재 colaw의 프론트를 참고하여 제작
백엔드의 경우 임시 DB에 아이디/패스워드 기능 구현.
단, 로그인에 성공해도 세션이 없기 때문에 다시 돌아옴

![로그인 데모](assets/ios_colaw.gif)

---
lib/
├── main.dart                    // 앱 진입점
├── app.dart                     // MaterialApp, 라우팅 정의
├── screens/                     // 화면 UI 파일들
│   ├── login_screen.dart       // 로그인 화면
│   └── home_screen.dart        // 로그인 이후 WebView로 띄울 홈 화면
├── widgets/                     // 공통 위젯 모음
│   └── custom_textfield.dart   // 커스텀 텍스트 필드 등
├── services/                    // API 통신 등 로직 담당
│   └── auth_service.dart       // 로그인 요청 처리
├── models/                      // 필요한 경우 로그인 모델 등
│   └── user.dart
├── constants/                   // 공통 상수값, 스타일 정의
│   ├── colors.dart
│   └── api_endpoints.dart      // API URL 등
└── utils/                       // 기타 유틸 함수
    └── validator.dart

assets/                          // 이미지, 폰트 등 정적 자원
├── images/
└── fonts/

├── backend-test/               // 백엔드 API 테스트 서버
│   ├── server.js               // 로그인 처리 및 가상 DB
│   ├── package.json            // Node.js 의존성
│   └── node_modules/           // npm install로 자동 생성됨

pubspec.yaml                    // 의존성 및 자원 정의

android/                        // 안드로이드 관련 설정
ios/                            // iOS 관련 설정
web/                            // Flutter Web용 설정 (옵션)

.gitignore                      // Git 무시 파일 목록
README.md                      // 프로젝트 설명
