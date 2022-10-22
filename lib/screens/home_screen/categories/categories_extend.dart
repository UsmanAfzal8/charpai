import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/product_model.dart';
import '../../../providers/product_provider.dart';
import '../list_view/list_view_extend.dart';

// ignore: must_be_immutable
class CategoriesExtend extends StatelessWidget {
  CategoriesExtend({super.key, required this.categoryName});
  String categoryName;

  @override
  Widget build(BuildContext context) {
    ProductProvider prouctPro = Provider.of<ProductProvider>(context);
    List<Product> products = <Product>[];
    if (categoryName == 'All') {
      products = prouctPro.products;
    } else {
      products = prouctPro.findByCategory(categoryName);
    }
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Text(
          categoryName,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GridView.count(
        childAspectRatio: 200 / 280,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        children: List.generate(products.length, (int index) {
          return ListViewScreen(
            product: products[index],
          );
        }),
      ),
    );
  }
}
