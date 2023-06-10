import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mbti_idealtype/testscreens/test1.dart';

class beforetest extends StatefulWidget {
  const beforetest({Key? key}) : super(key: key);

  @override
  State<beforetest> createState() => _beforeTestPageState();
}

class _beforeTestPageState extends State<beforetest> {
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
                    MaterialPageRoute(
                        builder: (context) => test1()),
                  );
                },
                child: Text(
                  '테스트 시작',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
