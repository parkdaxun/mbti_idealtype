import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mbti_idealtype/signup/setmbti.dart';
import 'package:mbti_idealtype/signup/signup.dart';

import 'home.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _LoginPageState();
}

class InputData {
  static User? inputData;
}

class _LoginPageState extends State<login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> Login(String email, String password) async {
    User user = User(email : email, password : password, myMBTI: '', idealMBTI: '');
    InputData.inputData = user;
  }

  bool _isButtonEnable = false;

  void _updateButtonState() {
    // 버튼이 활성화
    setState(() {
      _isButtonEnable =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '정보 입력하기',
          style: TextStyle(color: Color(0xff738D56)),
        ),
        elevation: 0.0,
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (_) {},
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:200.0, bottom: 12.0),
                  child: Text(
                    '이메일',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 360,
                        height: 48,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: '이메일을 입력해주세요.',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, top: 12),
                  child: Text(
                    '닉네임',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 360,
                        child: TextField(
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0),
                              hintText: '닉네임을 입력해주세요.',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              filled: true,
                              fillColor: Color(0xffF5F5F5),
                            ),
                            onChanged: (value) {
                              _updateButtonState();
                            },
                            controller: passwordController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 54.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Login(emailController.text, passwordController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => setmbti()),
                        );
                      },
                      child: Text(
                        "다음",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        onSurface: Color(0xff98C26C),
                        backgroundColor: Color(0xff98C26C),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0)),
                        minimumSize: Size(360, 48),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String password;
  final String email;
  final String myMBTI;
  final String idealMBTI;

  User({required this.email, required this.password, required this.myMBTI, required this.idealMBTI});
}