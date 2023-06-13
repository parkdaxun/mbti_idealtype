import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mbti_idealtype/testscreens/test1.dart';

class beforetest extends StatefulWidget {
  const beforetest({Key? key}) : super(key: key);

  @override
  State<beforetest> createState() => _beforeTestPageState();
}

class _beforeTestPageState extends State<beforetest> {
  int imageIndex = 0;

  List<String> imagePaths = [
    'assets/images/ENFJ.jpg',
    'assets/images/ENFP.jpg',
    'assets/images/ENTJ.jpg',
    'assets/images/ENTP.jpg',
    'assets/images/ESFJ.jpg',
    'assets/images/ESFP.jpg',
    'assets/images/ESTJ.jpg',
    'assets/images/ESTP.jpg',
    'assets/images/INFJ.jpg',
    'assets/images/INFP.jpg',
    'assets/images/INTJ.jpg',
    'assets/images/INTP.jpg',
    'assets/images/ISFJ.jpg',
    'assets/images/ISFP.jpg',
    'assets/images/ISTJ.jpg',
    'assets/images/ISTP.jpg',
  ];

  void changeImage() {
    setState(() {
      imageIndex = Random().nextInt(imagePaths.length);
    });
  }

  @override
  void initState() {
    super.initState();
    // 초기 이미지 변경
    changeImage();
    // 2초마다 이미지 변경
    Timer.periodic(Duration(seconds: 2), (timer) {
      changeImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Text(
              '테스트를 한번도 해보신적이 없으신가요?',
              style: TextStyle(
                color: Color(0xff738D56),
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 19),
            child: Text(
              '버튼을 눌러 테스트를 시작해보아요',
              style: TextStyle(
                color: Color(0xff738D56),
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Image.asset(
              imagePaths[imageIndex],
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 89),
                child: SizedBox(
                  width: 155,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff738D56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // 테두리의 둥근 정도
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => test1()),
                      );
                    },
                    child: Text(
                      '테스트 시작',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
