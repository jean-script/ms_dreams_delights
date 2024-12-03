import 'dart:ui';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 3) {
      hexColor += hexColor;
    }
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }

    // localLogWriter('HEXCOLOR: $hexColor');

    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
