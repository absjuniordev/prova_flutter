import 'dart:ui';

class CustomColor {
  final Color _gradientMainColor = const Color.fromARGB(255, 21, 40, 82);
  final Color _gradientSecColor = const Color.fromARGB(255, 28, 104, 66);
  final Color _fillColor = const Color.fromARGB(255, 230, 223, 223);
  final Color _buttomColor = const Color.fromARGB(255, 56, 143, 59);

  Color getGradientMainColor() {
    return _gradientMainColor;
  }

  Color getGradientSecColor() {
    return _gradientSecColor;
  }

  Color getFillColor() {
    return _fillColor;
  }

  Color getButtomColor() {
    return _buttomColor;
  }
}
