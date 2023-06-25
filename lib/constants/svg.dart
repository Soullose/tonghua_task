class SVG {
  const SVG._();

  static const String svgPath = 'assets/images';

  static String agvIconPath = '$svgPath/AGV'.svgSuffix();

  static String craneIconPath = '$svgPath/crane-svgrepo-com'.svgSuffix();
}

extension on String {
  String svgSuffix() => '$this.svg';
}
