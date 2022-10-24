import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/categories_provider.dart';
import 'categories_extend.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesProvider catPro = Provider.of<CategoriesProvider>(context);
    return Container(
      height: 30,
      width: double.infinity,
      child: ListView.builder(
        itemCount: catPro.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  // ignore: always_specify_types
                  MaterialPageRoute(
                      builder: (BuildContext context) => CategoriesExtend(
                            categoryName: catPro.categories[index].title,
                          )));
            },
            child: Container(
              width: 60,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Text(
                  catPro.categories[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },

        // ignore: always_specify_types
      ),
    );
  }
}
