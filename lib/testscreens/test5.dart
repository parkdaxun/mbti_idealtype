import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mbti_idealtype/testscreens/test6.dart';

class test5 extends StatefulWidget {
  const test5({Key? key}) : super(key: key);

  @override
  State<test5> createState() => _Test5PageState();
}

class _Test5PageState extends State<test5> {
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
                  '5',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '추운 겨울에 갑자기 시원한 커피가 먹고 싶어진 \n당신! 애인에게 말하자 애인은',
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
                      builder: (context) => test6()),
                );
              },
              child: Text(
                '너무 춥다 넌 여기 있어. 내가 갔다올게',
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
                        builder: (context) => test6()),
                  );
                },
                child: Text(
                  '따뜻하게 입고 가자. 같이 가면 더 따뜻해',
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
