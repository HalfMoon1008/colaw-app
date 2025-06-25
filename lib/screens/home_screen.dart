import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  late final String redirectUrl;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // ✅ context 사용 안전한 위치
    redirectUrl = ModalRoute.of(context)!.settings.arguments as String;

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => _isLoading = true),
          onPageFinished: (_) => setState(() => _isLoading = false),
        ),
      )
      ..loadRequest(Uri.parse(redirectUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}


// 쿠키를 직접 가져와보쟈
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late final WebViewController _controller;
//   bool _isLoading = true;
//   final cookieManager = WebViewCookieManager();

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     final args = ModalRoute.of(context)!.settings.arguments as Map;
//     final redirectUrl = args['url'] as String;
//     final jsessionid = args['jsessionid'] as String;

//     // ✅ JSESSIONID 쿠키를 수동으로 세팅
//     cookieManager.setCookie(
//       WebViewCookie(
//         name: 'JSESSIONID',
//         value: jsessionid,
//         domain: 'www.colaw.co.kr',
//         path: '/',
//       ),
//     );

//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageStarted: (_) => setState(() => _isLoading = true),
//           onPageFinished: (_) => setState(() => _isLoading = false),
//         ),
//       )
//       ..loadRequest(Uri.parse(redirectUrl));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           WebViewWidget(controller: _controller),
//           if (_isLoading)
//             const Center(child: CircularProgressIndicator()),
//         ],
//       ),
//     );
//   }
// }
