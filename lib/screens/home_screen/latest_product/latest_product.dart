import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import '../list_view/list_view_extend.dart';

class LatestProduct extends StatelessWidget {
  const LatestProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productPro = Provider.of<ProductProvider>(context);
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
        itemCount: productPro.products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return ListViewScreen(
            product: productPro.products[index],
          );
        },
      ),
    );
  }
}
