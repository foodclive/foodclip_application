import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/my_page_screen.dart';
import 'screens/product_page.dart';
import 'screens/text_analysis_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrition App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ProductPage(),
    TextAnalysisScreen(),
    MyPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 키보드 팝업 시 화면 레이아웃 조정
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Color(0xFF575656), // 선택된 아이템 색상
        unselectedItemColor: Colors.black38, // 선택되지 않은 아이템 색상
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: '상품'),
          BottomNavigationBarItem(icon: Icon(Icons.text_snippet), label: '분석'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ],
      ),
    );
  }
}
