import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "영양소 분석중",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              "잠시만 기다려주세요",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
