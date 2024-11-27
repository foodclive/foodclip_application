import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
            color: Colors.black54,
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
            color: Colors.black54,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 사용자 정보 카드
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // 위쪽 정렬
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[200],
                      child: Icon(Icons.person, color: Colors.grey, size: 40),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "홍길동",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                "님 안녕하세요!",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "내 정보 관리하기 >",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // 주문/배송, 포인트, 쿠폰, 리뷰
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInfoItem("주문 / 배송", "0"),
                    _buildDivider(),
                    _buildInfoItem("포인트", "0P"),
                    _buildDivider(),
                    _buildInfoItem("쿠폰", "0"),
                    _buildDivider(),
                    _buildInfoItem("리뷰", "0"),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // 나의 레시피 섹션
              _buildSectionTitle("나의 레시피"),
              _buildListItem("나에게 필요한 영양소"),
              _buildListItem("내 맞춤형 레시피 / 식단"),
              _buildListItem("찜 목록"),
              SizedBox(height: 20),

              // 쇼핑 섹션
              _buildSectionTitle("쇼핑"),
              _buildListItem("주문 내역 / 배송 조회"),
              _buildListItem("교환 / 반품 / 취소 내역"),
              _buildListItem("리뷰 목록 관리"),
              SizedBox(height: 20),

              // 고객 센터 섹션
              _buildSectionTitle("고객 센터"),
              _buildListItem("공지사항"),
              _buildListItem("이벤트"),
              _buildListItem("FAQ"),
              _buildListItem("1 : 1 문의"),
              _buildListItem("설정"),
            ],
          ),
        ),
      ),
    );
  }

  // 개별 정보 아이템
  Widget _buildInfoItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(fontSize: 12, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // 구분선
  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey[300],
    );
  }

  // 섹션 제목
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  // 리스트 아이템
  Widget _buildListItem(String title) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            title,
            style: TextStyle(fontSize: 14),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        Divider(height: 1, thickness: 1, color: Colors.grey[200]),
      ],
    );
  }
}

