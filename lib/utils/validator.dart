class Validator {
  static String? validateId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '아이디를 입력해주세요.';
    }
    if (value.length < 4) {
      return '아이디는 최소 4자 이상이어야 합니다.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '비밀번호를 입력해주세요.';
    }
    if (value.length < 6) {
      return '비밀번호는 최소 6자 이상이어야 합니다.';
    }
    return null;
  }
}
