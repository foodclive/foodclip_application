import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '홍길동 님',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
                Text(
                  '나의 신체건강, 분석 상태 확인하기',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 16),

                // 건강 분석 보기 카드
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              child: Icon(
                                Icons.show_chart,
                                color: Colors.green,
                                size: 80,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("건강 분석 보기"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 영양소 상태 카드
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "현재 ",
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                            TextSpan(
                              text: "홍길동",
                              style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: " 님의 영양 식단 상태",
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "영양소 부족",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(height: 16),

                      Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.sentiment_dissatisfied,
                                color: Colors.orange,
                                size: 50,
                              ),
                            ),
                            Positioned(
                              right: -10,
                              top: 8,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "ㅠ.ㅠ",
                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // 최근에 본 상품 섹션
                Text(
                  "최근에 본 상품",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(3, (index) => ProductCard()),
                  ),
                ),

                // 영양소 맞춤 추천 상품 섹션
                SizedBox(height: 32),
                Text(
                  "영양소 맞춤 추천 상품",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(5, (index) => ProductCard()),
                  ),
                ),

                // 현재 나에게 필요한 영양소 섹션
                SizedBox(height: 20),
                Text(
                  "현재 나에게 필요한 영양소",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                SizedBox(height: 16),

                // 영양소 차트와 레이블, 버튼
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: PieChart(
                          dataMap: {
                            "나트륨": 346,
                            "탄수화물": 67,
                            "당": 543,
                          },
                          colorList: [Colors.yellow, Colors.orange, Colors.green],
                          chartRadius: MediaQuery.of(context).size.width / 3,
                          legendOptions: LegendOptions(showLegends: false),
                          chartValuesOptions: ChartValuesOptions(
                            showChartValues: false,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "나의 영양소",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                            ),
                            SizedBox(height: 8),
                            _buildNutrientLabel("나트륨", Colors.yellow),
                            SizedBox(height: 8),
                            _buildNutrientLabel("탄수화물", Colors.orange),
                            SizedBox(height: 8),
                            _buildNutrientLabel("당", Colors.green),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("나에게 맞는 식단 추천 받기"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNutrientLabel(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
