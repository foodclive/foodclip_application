import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 2, blurRadius: 5)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Placeholder(fallbackHeight: 60, fallbackWidth: 60),
          SizedBox(height: 8),
          Text("상품 이름", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
