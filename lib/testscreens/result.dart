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
  bool flag = false; // false -> 좋은거 true -> 나쁜거

  Future<void> writeResult() async {
    await GetStorage.init();
    final GetStorage storage = GetStorage();

    setState(() {
      idealMBTI = storage.read('idealMBTI');
    });

    // 궁합 판단하기
    MBTIflag();
  }

  Future<void> MBTIflag() async {
    await GetStorage.init();
    final GetStorage storage = GetStorage();

    String idealMBTI = storage.read('idealMBTI');
    String myMBTI = storage.read('myMBTI');

    List<String> onlyISFP = ['INFP', 'ENFP', 'INFJ'];
    List<String> avoid = ['INFP', 'ENFP', 'INFJ', 'ENFJ'];
    List<String> avoidit = ['ESFP', 'ISTP', 'ESTP', 'ISFJ', 'ESFJ', 'ISTJ', 'ESTJ'];

    if(idealMBTI=="ISFP") { //이상형 엠비티아이가 ISFP라면
      bool isitin = onlyISFP.contains(myMBTI); // 그런데 내 엠비티아이가 안 좋은 궁합에 포함
      if(isitin) flag = true;
    }
    else if(myMBTI=="ISFP") { //내 엠비티아이가 ISFP라면
      bool isitin = onlyISFP.contains(idealMBTI); // 그런데 이상형 엠비티아이가 안 좋은 궁합
      if(isitin) flag = true;
    }
    else { // ISFP가 아니다
      bool avoid_yes = avoid.contains(myMBTI);
      bool avoid_it = avoidit.contains(idealMBTI);

      bool avoid_no = avoid.contains(idealMBTI);
      bool avoid_noit = avoidit.contains(myMBTI);
      if(avoid_yes && avoid_it) flag = true;
      else if(avoid_no && avoid_noit) flag = true;
    }

    setState(() {
      flag;
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
    String imagePath = "";

    if (idealMBTI == "ENFJ") {
      imagePath = 'assets/images/ENFJ.jpg';
    } else if (idealMBTI == "ENFP") {
      imagePath = 'assets/images/ENFP.jpg';
    } else if (idealMBTI == "ENTJ") {
      imagePath = 'assets/images/ENTJ.jpg';
    } else if (idealMBTI == "ENTP") {
      imagePath = 'assets/images/ENTP.jpg';
    } else if (idealMBTI == "ESFJ") {
      imagePath = 'assets/images/ESFJ.jpg';
    } else if (idealMBTI == "ESFP") {
      imagePath = 'assets/images/ESFP.jpg';
    } else if (idealMBTI == "ESTJ") {
      imagePath = 'assets/images/ESTJ.jpg';
    } else if (idealMBTI == "ESTP") {
      imagePath = 'assets/images/ESTP.jpg';
    } else if (idealMBTI == "INFJ") {
      imagePath = 'assets/images/INFJ.jpg';
    } else if (idealMBTI == "INFP") {
      imagePath = 'assets/images/INFP.jpg';
    } else if (idealMBTI == "INTJ") {
      imagePath = 'assets/images/INTJ.jpg';
    } else if (idealMBTI == "INTP") {
      imagePath = 'assets/images/INTP.jpg';
    } else if (idealMBTI == "ISFJ") {
      imagePath = 'assets/images/ISFJ.jpg';
    } else if (idealMBTI == "ISFP") {
      imagePath = 'assets/images/ISFP.jpg';
    } else if (idealMBTI == "ISTJ") {
      imagePath = 'assets/images/ISTJ.jpg';
    } else if (idealMBTI == "ISTP") {
      imagePath = 'assets/images/ISTP.jpg';
    }

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
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset(imagePath),
          ),
          Visibility(
            visible: flag,
            child: Isitok(),
          ),
          Visibility(
            visible: !flag,
            child: fine(),
          ),

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

  Padding fine() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        width: 326,
        height: 43,
        decoration: BoxDecoration(
          color: Color(0xff8EE537),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            '나의MBTI와 괜찮은 궁합',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
