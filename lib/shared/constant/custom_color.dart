import 'dart:ui';

class CustomColor {
  final Color _gradientMainColor = Color.fromARGB(255, 12, 54, 54);
  final Color _gradientSecColor = Color.fromARGB(255, 103, 146, 151);

  Color getGradientMainColor() {
    return _gradientMainColor;
  }

  Color getGradientSecColor() {
    return _gradientSecColor;
  }
}
