import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mbti_idealtype/testscreens/test7.dart';
import 'package:get_storage/get_storage.dart';

class test6 extends StatefulWidget {
  const test6({Key? key}) : super(key: key);

  @override
  State<test6> createState() => _Test6PageState();
}

class _Test6PageState extends State<test6> {
  Future<void> checkMBTI(int what) async {
    await GetStorage.init();
    final GetStorage storage = GetStorage();

    if (what == 1) {
      int N = storage.read('N') ?? 0;
      storage.write('N', N++);
      print("N");
    }
    else if (what == 2) {
      int S = storage.read('S') ?? 0;
      storage.write('S', S++);
      print("S");
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
                  '6',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '애인과 어떤 대회가 더 즐거울까',
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
                      builder: (context) => test7()),
                );
              },
              child: Text(
                '갑자기 좀비가 나타나면 어떡하지',
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
                        builder: (context) => test7()),
                  );
                },
                child: Text(
                  '날씨가 더워서 보일러가 터질 것 같은데',
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
