import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mbti_idealtype/testscreens/test8.dart';

class test7 extends StatefulWidget {
  const test7({Key? key}) : super(key: key);

  @override
  State<test7> createState() => _Test7PageState();
}

class _Test7PageState extends State<test7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 54),
              child: SizedBox(
                width: 87,
                height: 28,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // 테두리의 둥근 정도
                    color: Color(0xff738D56),
                  ),
                  child: Center(
                    child: Text(
                      '테스트',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Testname(),
            SelectOne(),
          ],
        ));
  }

  Padding Testname() {
    return Padding(
      padding: const EdgeInsets.only(top: 200, left: 40),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: Color(0xff74C6A4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  '7',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '나는 애인에게 헤어지자고 했다. 그러자 애인은?',
              style: TextStyle(
                color: Color(0xff738D56),
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding SelectOne() {
    return Padding(
      padding: const EdgeInsets.only(top: 41),
      child: Column(
        children: [
          Container(
            width: 326,
            height: 43,
            decoration: BoxDecoration(
                color: Color(0xff98C26C),
                borderRadius: BorderRadius.circular(15.0)),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => test8()),
                );
              },
              child: Text(
                '내가 잘못했어. 우리 다시 잘해보자',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:30.0),
            child: Container(
              width: 326,
              height: 43,
              decoration: BoxDecoration(
                  color: Color(0xff98C26C),
                  borderRadius: BorderRadius.circular(15.0)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => test8()),
                  );
                },
                child: Text(
                  '우리 왜 헤어져. 내가 잘못한거 있어?',
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
