# COLAW Flutter iOS 로그인 앱

Flutter 기반으로 iOS 느낌의 로그인 UI + WebView 기반 홈화면(세션 없이 구현) + 테스트용 백엔드 예시를 포함한 프로젝트입니다.

## 🚀 기능
- Flutter Frontend (iOS 스타일 로그인 화면 구성)
- WebView 활용한 `https://www.colaw.co.kr` 홈 화면 이동 (세션 문제로 다시 돌아옴)
- Node.js 기반 테스트용 로그인 서버 포함 (`backend-test/server.js`)
- 임시 사용자 DB 기반 로그인 API

## 📁 구조
- `lib/` : 앱 실행 코드  
- `assets/` : 이미지, 폰트 등  
- `backend-test/` : 로그인 API 테스트 서버  
- `android/, ios/, web/` : 플랫폼별 설정  

## 🛠️ 실행 방법

### Flutter 앱 실행
```bash
cd project-root
flutter pub get
flutter run
---
lib/
├── main.dart                    # 앱 진입점
├── app.dart                     # MaterialApp 및 라우트 설정
├── screens/                     # 화면 UI 모듈
│   ├── login_screen.dart        # 로그인 화면
│   └── home_screen.dart         # WebView 기반 홈 화면
├── widgets/                     # 재사용 가능한 위젯
│   └── custom_textfield.dart
├── services/                    # API 통신 로직
│   └── auth_service.dart
├── models/                      # 데이터 모델
│   └── user.dart
├── constants/                   # 상수 정의
│   ├── colors.dart
│   └── api_endpoints.dart
└── utils/                       # 유틸 함수 모음
    └── validator.dart

assets/                          # 정적 리소스
├── images/
└── fonts/

backend-test/                    # 테스트용 백엔드 (Node.js)
├── server.js
├── package.json
└── node_modules/

pubspec.yaml                     # 의존성 및 자원 선언

android/                         # Android 설정
ios/                             # iOS 설정
web/                             # Web 설정 (옵션)

.gitignore                       # Git 무시 목록
README.md                        # 프로젝트 설명
