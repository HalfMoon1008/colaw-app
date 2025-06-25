import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../services/auth_service.dart';
import '../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  void _login() async {
    final id = _idController.text.trim();
    final password = _passwordController.text.trim();

    if (id.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('아이디와 비밀번호를 입력해주세요.')),
      );
      return;
    }

    setState(() => _isLoading = true);

    final redirectUrl = await AuthService.login(id: id, password: password);

    setState(() => _isLoading = false);

    if (redirectUrl != null) {
      print('✅ 로그인 성공 → 홈으로 이동');
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: 'https://www.colaw.co.kr/mobileManage/mobileMainView',
      );
    } else {
      print('❌ 로그인 실패 처리됨 (redirectUrl == null)');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('로그인 실패 또는 결제 미완료입니다.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF368EF0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Stack(
            children: [
              Positioned(
                top: 120,
                right: -20,
                child: Image.asset(
                  'assets/images/human.png',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('2주 무료체험', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    '대한민국 1등 법무관리 플랫폼\nCOLAW',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '''법무사, 변호사 사무소의 사건관리 재무, 회계, 인력관리 등
비즈니스 프로세스를 통합하여 관리하는 법조인 전문 법무관리 시스템입니다.''',
                        style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 180),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'COLAW login',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text('로그인 후 이용하실 수 있습니다.', style: TextStyle(fontSize: 12, color: Colors.black54)),
                        const SizedBox(height: 12),
                        CustomTextField(controller: _idController, hintText: '아이디'),
                        const SizedBox(height: 12),
                        CustomTextField(controller: _passwordController, hintText: '비밀번호', obscureText: true),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: _isLoading ? null : _login,
                            child: _isLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text('LOGIN', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  //Image.asset('assets/images/bottom_nav.png', height: 48),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// 쿠키를 직접 가져와보자
// import 'package:flutter/material.dart';
// import '../widgets/custom_textfield.dart';
// import '../services/auth_service.dart';
// import '../constants/colors.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _idController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   bool _isLoading = false;

//   void _login() async {
//     final id = _idController.text.trim();
//     final password = _passwordController.text.trim();

//     if (id.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('아이디와 비밀번호를 입력해주세요.')),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);

//     final result = await AuthService.loginWithSession(id: id, password: password);

//     setState(() => _isLoading = false);

//     if (result != null) {
//       final redirectUrl = result['redirectUrl']!;
//       final jsessionid = result['jsessionid']!;
//       print('✅ 로그인 성공 → WebView로 이동');

//       Navigator.pushReplacementNamed(
//         context,
//         '/home',
//         arguments: {
//           'url': redirectUrl,
//           'jsessionid': jsessionid,
//         },
//       );
//     } else {
//       print('❌ 로그인 실패 (redirectUrl == null)');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('로그인 실패 또는 세션 오류입니다.')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF368EF0),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 100),
//               const Text(
//                 '대한민국 1등 법무관리 플랫폼\nCOLAW',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 180),
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     const Text(
//                       'COLAW login',
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 12),
//                     CustomTextField(controller: _idController, hintText: '아이디'),
//                     const SizedBox(height: 12),
//                     CustomTextField(controller: _passwordController, hintText: '비밀번호', obscureText: true),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       height: 48,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: primaryColor,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                         ),
//                         onPressed: _isLoading ? null : _login,
//                         child: _isLoading
//                             ? const CircularProgressIndicator(color: Colors.white)
//                             : const Text('LOGIN', style: TextStyle(fontSize: 16)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
