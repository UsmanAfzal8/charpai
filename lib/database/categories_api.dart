import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/categories/categories.dart';

class CategoriesApi {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static const String _collection = 'categories';
  Future<List<Categories>> categories() async {
    List<Categories> cat = <Categories>[];
    final QuerySnapshot<Map<String, dynamic>> doc =
        await _instance.collection(_collection).get();
    if (doc.docs.isEmpty) return cat;
    for (DocumentSnapshot<Map<String, dynamic>> element in doc.docs) {
      final Categories getterData = Categories.fromDoc(element);
      log(getterData.title);
      cat.add(getterData);
    }
    return cat;
  }
}
