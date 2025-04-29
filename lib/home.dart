import 'dart:math';

import 'package:e_commerce_app/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  double angleOffset = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..addListener(() {
            setState(() {
              angleOffset += 0.01;
            });
          })
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return 0.h;
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewmodel(),
      onViewModelReady: (model) => model.init(context),
      builder: (context, model, _) {
        return Center(
          child: GestureDetector(
            onHorizontalDragUpdate: (dragDetails) {
              _onHorizontalDragUpdate(dragDetails, model);
            },
            child: Flow(
              delegate: CircularFlowDelegate(
                radius: 120,
                angleOffset: model.angle,
              ),
              children:
                  model.homeProducts.map((e) {
                    return Container(
                      width: 100,
                      height: 100,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(e.icon),
                    );
                  }).toList(),
            ),
          ),
        );
      },
    );
  }

  _onHorizontalDragUpdate(DragUpdateDetails details, HomeViewmodel model) {
    model.angle += degreesToRadians(details.delta.dx * .5);
    model.notifyListeners();
  }

  double degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }
}

class CircularFlowDelegate extends FlowDelegate {
  final double radius;
  final double angleOffset;

  CircularFlowDelegate({required this.radius, required this.angleOffset});

  @override
  void paintChildren(FlowPaintingContext context) {
    final centerX = context.size.width / 2;
    final centerY = context.size.height / 2;
    final count = context.childCount;

    for (int i = 0; i < count; i++) {
      final angle = (2 * pi * i / count) + angleOffset;
      final x =
          centerX + radius * cos(angle) - context.getChildSize(i)!.width / 2;
      final y =
          centerY + radius * sin(angle) - context.getChildSize(i)!.height / 2;

      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(covariant CircularFlowDelegate oldDelegate) {
    return oldDelegate.angleOffset != angleOffset;
  }
}
