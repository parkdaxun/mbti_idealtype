import 'dart:convert';
import 'package:flutter/material.dart';
import '../home.dart';
import 'package:get_storage/get_storage.dart';

class result extends StatefulWidget {
  const result({Key? key}) : super(key: key);

  @override
  State<result> createState() => _ResultPageState();
}

class _ResultPageState extends State<result> {
  String idealMBTI = "";

  Future<void> writeResult() async {
    await GetStorage.init();
    final GetStorage storage = GetStorage();

    setState(() {
      idealMBTI = storage.read('idealMBTI');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    writeResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onHorizontalDragUpdate: (_) {},
      child: Column(
        children: [
          Center(
            child: Padding(
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
                      '결과',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ShowMBTI(),
          showInfo(),
          Isitok(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Text(
                '돌아가기',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Padding ShowMBTI() {
    return Padding(
      padding: const EdgeInsets.only(top: 41),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 43),
            child: Text(
              '이상형 MBTI는',
              style: TextStyle(
                color: Color(0xff738D56),
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              '$idealMBTI',
              style: TextStyle(
                color: Color(0xff738D56),
                fontSize: 53.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding showInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 41),
      child: Container(
        width: 326,
        height: 286,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Color(0xff98C26C),
              width: 3.0,
            )),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            '블라블라',
          ),
        ),
      ),
    );
  }

  Padding Isitok() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        width: 326,
        height: 43,
        decoration: BoxDecoration(
          color: Color(0xffE56137),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            '나의MBTI와 최악의 궁합',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
