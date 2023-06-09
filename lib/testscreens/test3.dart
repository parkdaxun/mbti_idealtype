import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mbti_idealtype/testscreens/test4.dart';
import 'package:get_storage/get_storage.dart';

class test3 extends StatefulWidget {
  const test3({Key? key}) : super(key: key);

  @override
  State<test3> createState() => _Test3PageState();
}

class _Test3PageState extends State<test3> {

  Future<void> checkMBTI(int what) async {
    await GetStorage.init();
    final GetStorage storage = GetStorage();

    if(what == 1) {
      int J = storage.read('J') ?? 0;
      storage.write('J', ++J);
      print("J");
    }
    else if(what == 2) {
      int P = storage.read('P') ?? 0;
      storage.write('P', ++P);
      print("P");
    }
  }

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
            Padding(
              padding: const EdgeInsets.only(top: 54),
              child: LinearProgressIndicator(
                value: 0.45,
                color: Color(0xff738D56),
                backgroundColor: Color(0xffb6b6b6),
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
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '나는 애인과 여행을 갈 떄',
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
                checkMBTI(1);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => test4()),
                );
              },
              child: Text(
                '빡빡한 계획! 플렌B까지 만들어야해',
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
                  checkMBTI(2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => test4()),
                  );
                },
                child: Text(
                  '계획 is 뭔들, 마음에 드는 곳에 즉흥적으로 들어가야지',
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
