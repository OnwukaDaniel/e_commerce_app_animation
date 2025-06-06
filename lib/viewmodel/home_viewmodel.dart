import 'dart:ui';

import 'package:e_commerce_app/data/home_product_data.dart';
import 'package:e_commerce_app/enum/main_category_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class HomeViewmodel extends BaseViewModel {
  MainCategoryEnum _selectedMainCategory = MainCategoryEnum.limited;

  MainCategoryEnum get selectedMainCategory => _selectedMainCategory;

  List<HomeProductData> homeProducts = [
    HomeProductData(
      name: 'Shoes',
      icon: 'assets/shoe_icon.png',
      subProduct: [
        HomeSubProduct('Shoe 101', 'assets/shoe1.png', 42000),
        HomeSubProduct('Canvas 27', 'assets/shoe2.png', 42000),
        HomeSubProduct('Dovan Slips', 'assets/shoe3.png', 32900),
        HomeSubProduct('Shoe 202', 'assets/shoe3.png', 52900),
      ],
    ),
    HomeProductData(
      name: 'Cardigan',
      icon: 'assets/cardigan_icon.png',
      subProduct: [
        HomeSubProduct('Cardigan X', 'assets/cardigan1.png', 42000),
        HomeSubProduct('Saint Slaves', 'assets/cardigan2.png', 42000),
        HomeSubProduct('Dovan Slips', 'assets/cardigan3.png', 32900),
        HomeSubProduct('Shoe 202', 'assets/cardigan4.png', 52900),
      ],
    ),
    HomeProductData(
      name: 'Suit',
      icon: 'assets/suit_icon.png',
      subProduct: [
        HomeSubProduct('Shoe 101', 'assets/suit1.png', 42000),
        HomeSubProduct('Canvas 27', 'assets/suit2.png', 42000),
        HomeSubProduct('Dovan Slips', 'assets/suit3.png', 32900),
        HomeSubProduct('Shoe 202', 'assets/suit4.png', 52900),
      ],
    ),
  ];

  double angle = 0;
  Offset focusProductCat = Offset(0, 0);

  late HomeProductData _selectedProduct;

  HomeProductData get selectedProduct => _selectedProduct;

  init(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final hWidth = s.width * .5;
    _selectedProduct = homeProducts.first;
    focusProductCat = Offset(hWidth, 1);
  }

  setMainCategory(MainCategoryEnum value) {
    _selectedMainCategory = value;
    notifyListeners();
  }

  setAngle(double input) {
    angle = input;
    notifyListeners();
  }
}
