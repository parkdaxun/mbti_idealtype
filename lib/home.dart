import 'package:flutter/material.dart';
import 'beforetest.dart';
import 'mypage.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _HomePageState();
}

class _HomePageState extends State<home> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    home(),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '홈화면',
          style: TextStyle(color: Color(0xff738D56)),
        ),
        elevation: 0.0,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}