import 'package:e_commerce_app/enum/main_category_enum.dart';
import 'package:stacked/stacked.dart';

class HomeViewmodel extends BaseViewModel {
  MainCategoryEnum _selectedMainCategory = MainCategoryEnum.limited;

  MainCategoryEnum get selectedMainCategory => _selectedMainCategory;

  setMainCategory(MainCategoryEnum value) {
    _selectedMainCategory = value;
    notifyListeners();
  }
}
