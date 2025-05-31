class HomeProductData {
  String name;
  String icon;
  List<HomeSubProduct> subProduct;

  HomeProductData({
    required this.name,
    required this.icon,
    required this.subProduct,
  });
}

class HomeSubProduct {
  String name;
  String icon;
  int price;

  HomeSubProduct(this.name, this.icon, this.price);
}
