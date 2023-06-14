import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mbti_idealtype/testscreens/result.dart';
import 'package:get_storage/get_storage.dart';

class test8 extends StatefulWidget {
  const test8({Key? key}) : super(key: key);

  @override
  State<test8> createState() => _Test8PageState();
}

class _Test8PageState extends State<test8> {
  Future<void> checkMBTI(int what) async {
    await GetStorage.init();
    final GetStorage storage = GetStorage();

    if (what == 1) {
      int N = storage.read('N') ?? 0;
      storage.write('N', ++N);
      print("N");
    } else if (what == 2) {
      int S = storage.read('S') ?? 0;
      storage.write('S', ++S);
      print("S");
    }

    String ideal = "";

    int E = storage.read('E') ?? 0;
    int I = storage.read('I') ?? 0;
    int N = storage.read('N') ?? 0;
    int S = storage.read('S') ?? 0;
    int F = storage.read('F') ?? 0;
    int T = storage.read('T') ?? 0;
    int J = storage.read('J') ?? 0;
    int P = storage.read('P') ?? 0;

    String EI = "";
    print(E);
    print(I);
    if (E > I) {
      EI =  "E";
      print(EI);
    }
    else if (E < I) EI = "I";
    else if(E==I) EI="I";

    print(EI);

    String NS = "";
    if (N > S)
      NS = "N";
    else if (N < S) NS = "S";
    else if(N == S) NS = "N";

    String FT = "";
    if (F > T)
      FT = "F";
    else if (F < T) FT = "T";
    else if(F == T) FT = "F";

    String JP = "";
    if (J > P)
      JP = "J";
    else if (J < P) JP = "P";
    else if(J==P) JP = "P";

    ideal = EI + NS + FT + JP;
    print(ideal);
    storage.write('idealMBTI', ideal);
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
            value: 1,
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
                  '8',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '헤어진 당신',
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
                  MaterialPageRoute(builder: (context) => result()),
                );
              },
              child: Text(
                '애인과 함께 찍었던 사진 보며 추억여행',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
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
                    MaterialPageRoute(builder: (context) => result()),
                  );
                },
                child: Text(
                  '헤어질 이유가 마땅했어. 괜찮아지겠지',
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
