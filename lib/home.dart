import 'package:e_commerce_app/enum/main_category_enum.dart';
import 'package:e_commerce_app/extensions/size_extension.dart';
import 'package:e_commerce_app/paints/home_dail_paint.dart';
import 'package:e_commerce_app/viewmodel/home_viewmodel.dart';
import 'package:e_commerce_app/views/system_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'FATCO',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 24)),
              8.w,
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart_outlined, size: 24),
              ),
              12.w,
            ],
          ),
          body: ListView(
            children: [
              SystemAppBar(),
              (kToolbarHeight * 1.5).h,
              CustomPaint(
                size: Size(size.width, size.height - (kToolbarHeight * 2)),
                painter: HomeDailPaint(),
              ),
            ],
          ),
        );
      },
    );
  }
}
