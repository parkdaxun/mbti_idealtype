import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mbti_idealtype/testscreens/test2.dart';
import 'package:get_storage/get_storage.dart';

class test1 extends StatefulWidget {
  const test1({Key? key}) : super(key: key);

  @override
  State<test1> createState() => _Test1PageState();
}


class _Test1PageState extends State<test1> {

  Future<void> checkMBTI(int what) async {
    await GetStorage.init();
    final GetStorage storage = GetStorage();

    if(what == 1) {
      int E = storage.read('E') ?? 0;
      storage.write('E', ++E);
      print("E");
    }
    else if(what == 2) {
      int I = storage.read('I') ?? 0;
      storage.write('I', ++I);
      print("I");
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
                  '1',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '나는 애인이 퇴근한 후',
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
                      builder: (context) => test2()),
                );
                },
              child: Text(
                '인싸답게 친구들과의 모임을 즐기면 좋겠어',
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
                        builder: (context) => test2()),
                  );
                },
                child: Text(
                  '집순(돌)이라서 집에서 혼자만의 시간을 가지면 좋겠어',
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