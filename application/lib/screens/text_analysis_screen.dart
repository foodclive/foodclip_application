import 'package:flutter/material.dart';
import 'loading_screen.dart';

class TextAnalysisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "텍스트로 분석하기",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView( // 스크롤 가능하도록 감싸기
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제목
              Text(
                "텍스트로 분석하기",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "현재 회원님 몸의 질병이나 증상 등을 작성해주세요",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 24),

              // 질병 작성하기
              Text(
                "질병 작성하기",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "질병에 대해 작성해주세요",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // 증상 작성하기
              Text(
                "증상 작성하기",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "증상에 대해 작성해주세요",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // 분석하기 버튼
              Align(
                alignment: Alignment.centerRight, // 오른쪽 정렬
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoadingScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "분석하기",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 16), // 버튼 아래 공간 추가
            ],
          ),
        ),
      ),
    );
  }
}
