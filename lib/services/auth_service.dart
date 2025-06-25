import 'package:flutter/material.dart';

class AuthService {
  // 임시 사용자 DB (ID → Password)
  static final Map<String, String> _fakeUserDB = {
    'test': '1234',
    'admin': 'pass123',
    'lawyer': 'colaw2024',
    'sanghyun': 'moonrocks',
  };

  // 로그인 검증 함수
  static Future<String?> login({required String id, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 800)); // UX용 딜레이

    // 해당 ID가 존재하고, PW가 일치하는지 확인
    if (_fakeUserDB.containsKey(id) && _fakeUserDB[id] == password) {
      const redirectUrl = 'https://www.colaw.co.kr/mobileManage/mobileMainView';
      print('로그인 성공: $id');
      return redirectUrl;
    } else {
      print('로그인 실패: $id / $password');
      return null;
    }
  }
}
