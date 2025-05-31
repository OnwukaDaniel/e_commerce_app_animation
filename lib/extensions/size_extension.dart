import 'package:flutter/cupertino.dart';

extension ScreenSizes on int{
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}
extension ScreenSizesDOuble on double{
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}