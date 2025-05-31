import 'package:e_commerce_app/enum/main_category_enum.dart';
import 'package:e_commerce_app/extensions/size_extension.dart';
import 'package:e_commerce_app/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SystemAppBar extends StackedHookView<HomeViewmodel> {
  const SystemAppBar({super.key});

  @override
  Widget builder(BuildContext context, model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          MainCategoryEnum.values.map((e) {
            return Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () => model.setMainCategory(e),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        e.name,
                        style: TextStyle(
                          fontWeight:
                              e == model.selectedMainCategory
                                  ? FontWeight.w900
                                  : FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      4.h,
                      if (e == model.selectedMainCategory)
                        Container(
                          width: (3 * e.name.length).toDouble(),
                          height: 3,
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemOrange,
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
