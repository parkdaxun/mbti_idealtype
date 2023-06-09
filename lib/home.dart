import 'package:flutter/material.dart';
import 'package:mbti_idealtype/beforetest.dart';
import 'package:mbti_idealtype/mypage.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    beforetest(),
    mypage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // 선택된 아이템 색상 설정
        selectedItemColor: Color(0xff738D56),
        // 선택되지 않은 아이템 색상 설정
        unselectedItemColor: Color(0xff929292),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '이상형 찾기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:200),
            child: Text(
              '테스트를 한번도 해보신적이 없으신가요?',
              style: TextStyle(color: Color(0xff738D56), fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:19),
            child: Text(
              '버튼을 눌러 테스트를 시작해보아요',
              style: TextStyle(color: Color(0xff738D56), fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:89),
            child: SizedBox(
              width: 155, height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff738D56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50), // 테두리의 둥근 정도
                  ),
                ),
                onPressed: () {},
                child: Text('테스트 시작', style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}