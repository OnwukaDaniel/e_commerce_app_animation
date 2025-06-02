import 'dart:math';

import 'package:e_commerce_app/extensions/size_extension.dart';
import 'package:e_commerce_app/paints/home_dail_paint.dart';
import 'package:e_commerce_app/viewmodel/home_viewmodel.dart';
import 'package:e_commerce_app/views/system_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double radius = size.width * 1;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewmodel(),
      onViewModelReady: (model) => model.init(context),
      builder: (context, model, _) {
        debugPrint('------------ ${size.height - (kToolbarHeight * 2)}');
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
              SizedBox(
                height: size.height - (kToolbarHeight * 2),
                child: GestureDetector(
                  onHorizontalDragUpdate: (dragDetails) {
                    _onHorizontalDragUpdate(dragDetails, model);
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        height: size.height - (kToolbarHeight * 2),
                        width: radius,
                        child: CustomPaint(
                          size: Size(radius, size.height - (kToolbarHeight * 2)),
                          painter: HomeDailPaint(),
                        ),
                      ),
                      ...model.homeProducts.asMap().map((index, e) {
                        return MapEntry(
                          index,
                          Builder(
                            builder: (context) {
                              Offset center = Offset(
                                size.width * .35,
                                size.height * .25,
                              );

                              final r = size.width / 2;
                              final s =
                                  model.focusProductCat.dx +
                                  (index != 0
                                      ? (index * model.gapDifference) +
                                          (index * model.imgDiameter)
                                      : 0.0) + model.angle;
                              final a = (s / r) - (pi / 2);
                              return Transform.translate(
                                offset: center + Offset.fromDirection(a, r),
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    model.homeProducts[index].icon,
                                    width: model.imgDiameter,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }).values,
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _onHorizontalDragUpdate(DragUpdateDetails details, HomeViewmodel model) {
    model.angle += details.delta.dx;
    debugPrint('------------ ${model.angle}');
    model.notifyListeners();
  }
}

class MyFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    context.paintChild(0, transform: Matrix4.rotationX(2 * pi));
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
  /*Flow(
                        delegate: MyFlowDelegate(),
                        children: [
                          Container(width: 100, height: 100, color: Colors.white),
                        ],
                      )*/
}
