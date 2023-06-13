import 'package:flutter/material.dart';
import 'package:mbti_idealtype/login.dart';

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(), // Splash 화면을 첫 번째 화면으로 설정
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // 일부 초기화 작업을 수행하거나 필요한 데이터를 미리 로드하는 등의 작업을 여기에서 수행합니다.
    // 예를 들면, 네트워크 요청, 데이터베이스 초기화 등을 수행할 수 있습니다.

    // 일정 시간이 지난 후에 다음 화면으로 이동하도록 설정합니다.
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => login()), // Splash 이후에 보여줄 화면으로 이동
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.jpg'), // assets 폴더에 추가한 이미지를 사용하여 화면에 표시
      ),
    );
  }
}
