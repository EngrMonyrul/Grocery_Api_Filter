// ignore_for_file: iterable_contains_unrelated_type

import 'package:flutter/foundation.dart';
import 'package:simplegrocery/helper/api_data.dart';
import 'package:simplegrocery/helper/navigation.dart';
import 'package:simplegrocery/src/model/store_product_model.dart';

class HomePageProvider extends ChangeNotifier {
  late NavigationHelper navigationHelper;

  HomePageProvider(this.navigationHelper) {
    getAllData();
  }

  List<StoreProduct> apiProducts = [];
  List<StoreProduct> products = [];
  List<String> filterList = [];

  addProducts() {
    products = apiProducts.where((element) {
      return filterList.isEmpty || filterList.contains(element.category);
    }).toList();
    notifyListeners();
  }

  addFilterList({required String value}) {
    filterList.add(value);
    addProducts();
    notifyListeners();
  }

  removeFilterList({required String value}) {
    filterList.remove(value);
    addProducts();
    notifyListeners();
  }

  getAllData() async {
    navigationHelper.showLoading();
    try {
      final fetchedData = await ApiData().fetchAllData();
      apiProducts = await fetchedData
          .map<StoreProduct>((item) => StoreProduct.fromJson(item))
          .toList();
      debugPrint(products.toString());
      addProducts();
    } catch (e) {
      rethrow;
    }
    navigationHelper.goBack();
    notifyListeners();
  }
}
