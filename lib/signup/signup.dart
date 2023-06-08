import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mbti_idealtype/signup/setmbti.dart';

import '../home.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _SignupPageState();
}

class _SignupPageState extends State<signup> {
  final email = TextEditingController();
  final password = TextEditingController();
  final checkpassword = TextEditingController();
  bool _isButtonEnable = false;

  void _updateButtonState() {
    // 버튼이 활성화
    setState(() {
      _isButtonEnable =
          email.text.isNotEmpty && password.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '회원가입',
          style: TextStyle(color: Color(0xff738D56)),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
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
                          controller: email,
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
                    '비밀번호',
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
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0),
                            hintText: '비밀번호를 입력해주세요.',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                          ),
                          controller: password,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, top: 12),
                  child: Text(
                    '비밀번호 확인',
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
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0),
                            hintText: '비밀번호를 다시 입력해주세요.',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                          ),
                          controller: password,
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