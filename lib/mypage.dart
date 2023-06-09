import 'dart:convert';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:get_storage/get_storage.dart';

class mypage extends StatefulWidget {
  const mypage({Key? key}) : super(key: key);

  @override
  State<mypage> createState() => _MyPageState();
}

class _MyPageState extends State<mypage> {
  User? inputData = InputData.inputData;
  String idealMBTI = "";
  String myMBTI = "";

  Future<void> writeResult() async {
    await GetStorage.init();
    final GetStorage storage = GetStorage();

    setState(() {
      idealMBTI = storage.read('idealMBTI');
      myMBTI = storage.read('myMBTI');
    });

    print(idealMBTI);
    print(myMBTI);
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '마이페이지',
          style: TextStyle(color: Color(0xff738D56)),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          MBTI(),
          MyInfo(),
          Logout(),
        ],
      ),
    );
  }

  Padding MBTI() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              children: [
                Text(
                  '$myMBTI',
                  style: TextStyle(
                    fontSize: 53,
                    color: Color(0xff738D56),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '나의 MBTI',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff738D56),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Icon(
              Icons.favorite_border,
              color: Color(0xff738D56),
              size: 48.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              children: [
                Text(
                  '$idealMBTI',
                  style: TextStyle(
                    fontSize: 53,
                    color: Color(0xff738D56),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '이상형의 MBTI',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff738D56),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding MyInfo() {
    String email = inputData?.email ?? "";
    String password = inputData?.password ?? "";
    String mymbti = inputData?.myMBTI ?? "";

    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 290, bottom: 9),
            child: Text(
              '이메일',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color(0xff738D56),
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 326,
              height: 43,
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '$email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 270, bottom: 9),
            child: Text(
              '닉네임',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color(0xff738D56),
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 326,
              height: 43,
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '$password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding Logout() {
    return Padding(
      padding: const EdgeInsets.only(top: 130),
      child: Container(
        width: 326,
        height: 46,
        decoration: BoxDecoration(
            color: Color(0xff98C26C),
            borderRadius: BorderRadius.circular(15.0)),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => login()),
            );
          },
          child: Text(
            '처음으로 돌아가기',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
