import 'dart:convert';
import 'package:flutter/material.dart';

import '../home.dart';

class setmbti extends StatefulWidget {
  const setmbti({Key? key}) : super(key: key);

  @override
  State<setmbti> createState() => _SetMBTIPageState();
}

class _SetMBTIPageState extends State<setmbti> {
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
                    '본인의 MBTI를 입력해주세요',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff738D56),
                    ),
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
                          decoration: InputDecoration(
                            hintText: 'MBTI를 입력해주세요',
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
              ],
            ),
            Center(
              child:
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => home()),
                        );
                      },
                      child: Text(
                        "준비 완료",
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
              ),
          ],
        ),
      ),
    );
  }
}