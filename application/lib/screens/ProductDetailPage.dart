import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  final String productDiscount;

  ProductDetailPage({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDiscount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8), // 페이지 배경색
      appBar: AppBar(
        title: Text("제품 상세 페이지"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 이전 페이지로 이동
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상품 이미지 및 이름
              Center(
                child: Column(
                  children: [
                    Image.network(
                      productImage,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16),
                    Text(
                      productName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$productDiscount 할인 ",
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          productPrice,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // 탭바 (상품정보, 리뷰, 문의)
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.green,
                      tabs: [
                        Tab(text: "상품정보"),
                        Tab(text: "리뷰 466"),
                        Tab(text: "문의"),
                      ],
                    ),
                    SizedBox(
                      height: 150,
                      child: TabBarView(
                        children: [
                          Center(child: Text("상품정보 내용")),
                          Center(child: Text("리뷰 내용")),
                          Center(child: Text("문의 내용")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // 회원님 추천 상품
              _buildSection("회원님 추천 상품"),
              _buildHorizontalProductList(),

              // 비슷한 상품
              _buildSection("비슷한 상품"),
              _buildHorizontalProductList(),

              // 마켓의 다른 상품
              _buildSection("마켓의 다른 상품"),
              _buildHorizontalProductList(),

              SizedBox(height: 16),

              // 브랜드 정보
              _buildBrandSection(),

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // 섹션 제목
  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // 수평 상품 리스트
  Widget _buildHorizontalProductList() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image, size: 60, color: Colors.grey),
                SizedBox(height: 8),
                Text("상품명", style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }

  // 브랜드 정보 섹션
  Widget _buildBrandSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.store, color: Colors.grey),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "풀무원",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text("대표번호: 000-000-0000", style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text("주소: 경기도 성남시 분당구 판교로 14", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  // 하단 구매 버튼
  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.favorite_border, color: Colors.red),
          SizedBox(width: 8),
          Text("8.3천", style: TextStyle(fontSize: 12, color: Colors.red)),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: Text("구매하기"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
