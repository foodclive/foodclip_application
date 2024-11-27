import 'package:flutter/material.dart';
import 'package:application/screens/ProductDetailPage.dart';


class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedCategory = "샐러드";
  String selectedNutrientCategory = "샐러드";

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
                _buildHeader(),
                SizedBox(height: 20),
                _buildBanner(),
                SizedBox(height: 20),
                _buildSectionTitle("최근에 본 상품"),
                _buildHorizontalProductList(),
                SizedBox(height: 20),
                _buildSectionTitle("내가 찜한 상품과 유사한 상품"),
                _buildHorizontalProductList(),
                SizedBox(height: 20),
                _buildSectionTitle("영양소 맞춤 추천 상품"),
                _buildCategoryTabs(),
                SizedBox(height: 12),
                _buildHorizontalProductList(),
                SizedBox(height: 20),
                _buildSectionTitle("회원님을 위한 추천 상품"),
                _buildNutrientCategoryTabs(),
                SizedBox(height: 12),
                _buildGridProductList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
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
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "검색어를 입력하세요",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16),
        Icon(Icons.notifications_none, color: Colors.black, size: 28),
        SizedBox(width: 16),
        Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 28),
      ],
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[300],
      ),
      alignment: Alignment.center,
      child: Text(
        "김치만두 마침내 정복하다",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
    );
  }

  Widget _buildHorizontalProductList() {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          return ProductCard(
            productName: "상품 ${index + 1}",
            productImage: "https://via.placeholder.com/150",
            productPrice: "12,900원",
            productDiscount: "4%",
          );
        },
      ),
    );
  }

  Widget _buildCategoryTabs() {
    final categories = ["샐러드", "밀키트", "가공식품"];
    return Row(
      children: categories.map((category) {
        final isActive = selectedCategory == category;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedCategory = category;
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isActive ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green, width: 1),
            ),
            child: Text(
              category,
              style: TextStyle(
                fontSize: 14,
                color: isActive ? Colors.white : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNutrientCategoryTabs() {
    final categories = ["샐러드", "볶음면", "찌개", "구이"];
    return Row(
      children: categories.map((category) {
        final isActive = selectedNutrientCategory == category;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedNutrientCategory = category;
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isActive ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green, width: 1),
            ),
            child: Text(
              category,
              style: TextStyle(
                fontSize: 14,
                color: isActive ? Colors.white : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildGridProductList() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2 / 3,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return DiscountedProductCard(
          title: "상품 ${index + 1}",
          price: "23,900",
          discountRate: "7%",
        );
      },
    );
  }
}

// 클릭 가능한 ProductCard
class ProductCard extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  final String productDiscount;

  ProductCard({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDiscount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              productName: productName,
              productImage: productImage,
              productPrice: productPrice,
              productDiscount: productDiscount,
            ),
          ),
        );
      },
      child: Container(
        width: 120,
        margin: EdgeInsets.only(right: 12),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(productImage, height: 80, width: 80),
            SizedBox(height: 8),
            Text(
              productName,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// DiscountedProductCard 유지
class DiscountedProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String discountRate;

  DiscountedProductCard({
    required this.title,
    required this.price,
    required this.discountRate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            child: Center(
              child: Placeholder(fallbackHeight: 80, fallbackWidth: 80),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$discountRate $price",
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
                SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
