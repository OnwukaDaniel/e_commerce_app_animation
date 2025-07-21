import 'dart:ui' as ui;

import 'package:flutter/services.dart';

extension ImageExtension on String{

  Future<ui.Image> get getImage async => await loadImage(this);

  Future<ui.Image> loadImage(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }
}