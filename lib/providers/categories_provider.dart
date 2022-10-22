import 'package:flutter/cupertino.dart';

import '../database/categories_api.dart';
import '../models/categories/categories.dart';

class CategoriesProvider with ChangeNotifier {
  CategoriesProvider() {
    load();
  }
  List<Categories> _categories = <Categories>[];

  List<Categories> get categories => <Categories>[..._categories];

  load() async {
    _categories.clear();
    _categories = await CategoriesApi().categories();
  }


     //Search in the product
  String? _search;
  onSearch(String? value) {
    _search = value;
    notifyListeners();
  }
  List<String> forSearch() {
    final List<String> temp = <String>[];
    for (Categories element in _categories) {
      if (_search == null || (_search?.isEmpty ?? true)) {
        temp.add('');
      } else if (element.title
          .toLowerCase()
          .startsWith((_search?.toLowerCase() ?? ''))) {
        temp.add(element.title);
      }
    }
    return temp;
  }
  
}
