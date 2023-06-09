import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../home.dart';
import '../login.dart';

class setmbti extends StatefulWidget {
  const setmbti({Key? key}) : super(key: key);

  @override
  State<setmbti> createState() => _SetMBTIPageState();
}

class _SetMBTIPageState extends State<setmbti> {
  User? inputData = InputData.inputData;
  final MBTIController = TextEditingController();

  Future<void> Ready(String mymbti) async {
    await GetStorage.init();
    final GetStorage storage = GetStorage();

    setState(() {
      storage.write('myMBTI', mymbti);
    });
    print(mymbti);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'MBTI 입력',
          style: TextStyle(color: Color(0xff738D56)),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:200.0, bottom: 12.0),
                  child: Text(
                    '본인의 MBTI를 입력해주세요',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff738D56),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 360,
                        height: 48,
                        child: TextField(
                          controller: MBTIController,
                          decoration: InputDecoration(
                            hintText: 'MBTI를 입력해주세요',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child:
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Ready(MBTIController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home()),
                        );
                      },
                      child: Text(
                        "준비 완료",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        onSurface: Color(0xff98C26C),
                        backgroundColor: Color(0xff98C26C),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0)),
                        minimumSize: Size(360, 48),
                      ),
                    ),
                  ),
              ),
          ],
        ),
      ),
    );
  }
}