import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String pid;
  final double amount;
  final String colors;
  final String quantity;
  final String productname;
  final String description;
  final int timestamp;
  final String category;
  final String subCategory;
  final String createdByUID;
  final String imageurl;
  Product({
    required this.pid,
    required this.amount,
    required this.colors,
    required this.quantity,
    required this.productname,
    required this.description,
    required this.timestamp,
    required this.category,
    required this.subCategory,
    required this.createdByUID,
    required this.imageurl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pid': pid,
      'amount': amount,
      'colors': colors,
      'quantity': quantity,
      'description': description,
      'timestamp': timestamp,
      'category': category,
      'sub_category': subCategory,
      'created_by_uid': createdByUID,
      'image_url': imageurl,
      'product_name': productname
    };
  }

  factory Product.fromMap(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Product(
        pid: doc.data()?['pid'] ?? '',
        amount: doc.data()?['amount'] ?? 0,
        colors: doc.data()?['colors'] ?? '',
        quantity: doc.data()?['quantity'] ?? '',
        description: doc.data()?['description'] ?? '',
        timestamp: doc.data()?['timestamp'] ?? '',
        category: doc.data()?['category'] ?? '',
        subCategory: doc.data()?['sub_category'] ?? '',
        createdByUID: doc.data()?['created_by_uid'] ?? '',
        productname: doc.data()?['product_name'],
        imageurl: doc.data()?['image_url'] ?? '');
  }
}
