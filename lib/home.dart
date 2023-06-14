import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mbti_idealtype/beforetest.dart';
import 'package:mbti_idealtype/mypage.dart';
import 'login.dart';


class Home extends StatelessWidget {
  final theme = ThemeData(
    primaryColor: Color(0xff738D56),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Example',
      theme: theme,
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
  User? inputData = InputData.inputData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:100),
            child: Text(
              '나의 이상형 MBTI는 뭘까?',
              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }


}