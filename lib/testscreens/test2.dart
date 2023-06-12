import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mbti_idealtype/testscreens/test3.dart';
import 'package:get_storage/get_storage.dart';

class test2 extends StatefulWidget {
  const test2({Key? key}) : super(key: key);

  @override
  State<test2> createState() => _Test2PageState();
}

class _Test2PageState extends State<test2> {

  Future<void> checkMBTI(int what) async {
    await GetStorage.init();
    final GetStorage storage = GetStorage();

    if(what == 1) {
      int F = storage.read('F') ?? 0;
      storage.write('F', ++F);
      print("F");
    }
    else if(what == 2) {
      int E = storage.read('E') ?? 0;
      storage.write('E', ++E);
      print("E");
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
                  '2',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '나는 애인과 대화할때 애인이',
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
                      builder: (context) => test3()),
                );
              },
              child: Text(
                '나의 말을 묵묵하게 들어주고 공감해주면 좋겠어',
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
                        builder: (context) => test3()),
                  );
                },
                child: Text(
                  '참새마냥 말을 많이하고 나는 묵묵하게 들어주고 싶어',
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
