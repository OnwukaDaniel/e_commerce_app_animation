import 'dart:math';
import 'package:e_commerce_app/extensions/size_extension.dart';
import 'package:e_commerce_app/paints/home_dail_paint2.dart';
import 'package:e_commerce_app/viewmodel/home_viewmodel.dart';
import 'package:e_commerce_app/views/system_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isLandScape = size.width > size.height;
    final r = (size.width * (isLandScape ? .6 : .9));
    final dialCanvasHeight = size.height - (kToolbarHeight * 4);

    //return 0.h;
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewmodel(),
      onViewModelReady: (model) => model.init(context),
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
            physics:
                isLandScape
                    ? BouncingScrollPhysics()
                    : NeverScrollableScrollPhysics(),
            children: [
              SystemAppBar(),
              (kToolbarHeight * 1.5).h,
              GestureDetector(
                onHorizontalDragUpdate: (dragDetails) {
                  _onHorizontalDragUpdate(dragDetails, model);
                },
                onVerticalDragUpdate: (dragDetails) {
                  _onHorizontalDragUpdate(dragDetails, model);
                },
                child: SizedBox(
                  height: dialCanvasHeight,
                  width: r,
                  child: FutureBuilder(
                    future: model.getImages(
                      model.homeProducts.map((e) => e.icon).toList(),
                    ),
                    builder: (_, snapshot) {
                      if (snapshot.data == null) return 0.w;
                      return CustomPaint(
                        painter: HomeDailPaint2(
                          size,
                          r,
                          snapshot.data!,
                          model.focusProductCat.dx,
                          model.gapDifference,
                          model.imgDiameter,
                          model.angle,
                        ),
                      );
                    },
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
