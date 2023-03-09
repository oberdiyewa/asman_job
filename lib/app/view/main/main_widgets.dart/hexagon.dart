import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HexagonFAB extends StatelessWidget {
  HexagonFAB({
    super.key,
    required this.size,
    this.radiusColor,
    this.radiusWidth,
    required this.icon,
    this.elevationColor = Colors.black,
    this.elevation = 2.0,
  }) : assert(icon.isNotEmpty, 'Icon asset must be provided');

  final double size;
  final Color? radiusColor;
  final double? radiusWidth;
  final String icon;
  final Color elevationColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      color: elevationColor,
      clipper: _HexagonClipper(),
      elevation: elevation,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size * 0.9),
            painter: _HexagonPainter(
              radiusColor: radiusColor,
              radiusWidth: radiusWidth,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: SvgPicture.asset(
                icon,
                height: size * 0.4,
                width: size * 0.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  _HexagonPainter({
    this.color = Colors.white,
    this.radiusColor,
    this.radiusWidth,
  });

  final Color color;
  final Color? radiusColor;
  final double? radiusWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final path_body = _paintBody(size);
    Paint paint_body_fill = Paint()..style = PaintingStyle.fill;
    paint_body_fill.color = color;
    canvas.drawPath(path_body, paint_body_fill);

    if (radiusColor != null || radiusWidth != null) {
      Paint paint_border_fill = Paint()..style = PaintingStyle.stroke;

      if (radiusColor != null) {
        paint_border_fill.color = radiusColor!;
      }

      if (radiusWidth != null) {
        paint_border_fill.strokeWidth = radiusWidth!;
      }

      canvas.drawPath(path_body, paint_border_fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return _paintBody(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

Path _paintBody(Size size) {
  Path path_0 = Path();
  path_0.moveTo(size.width * 0.2402794, size.height * 0.09161786);
  path_0.cubicTo(
      size.width * 0.2540159,
      size.height * 0.06557821,
      size.width * 0.2791317,
      size.height * 0.04956839,
      size.width * 0.3064270,
      size.height * 0.04945464);
  path_0.lineTo(size.width * 0.6942825, size.height * 0.04783875);
  path_0.cubicTo(
      size.width * 0.7222270,
      size.height * 0.04772232,
      size.width * 0.7481921,
      size.height * 0.06427982,
      size.width * 0.7622651,
      size.height * 0.09118857);
  path_0.lineTo(size.width * 0.9537048, size.height * 0.4572661);
  path_0.cubicTo(
      size.width * 0.9677762,
      size.height * 0.4841750,
      size.width * 0.9677825,
      size.height * 0.5172804,
      size.width * 0.9537190,
      size.height * 0.5439393);
  path_0.lineTo(size.width * 0.7585238, size.height * 0.9139661);
  path_0.cubicTo(
      size.width * 0.7447873,
      size.height * 0.9400054,
      size.width * 0.7196698,
      size.height * 0.9560161,
      size.width * 0.6923746,
      size.height * 0.9561286);
  path_0.lineTo(size.width * 0.3045190, size.height * 0.9577446);
  path_0.cubicTo(
      size.width * 0.2765746,
      size.height * 0.9578607,
      size.width * 0.2506095,
      size.height * 0.9413036,
      size.width * 0.2365381,
      size.height * 0.9143946);
  path_0.lineTo(size.width * 0.04509714, size.height * 0.5483179);
  path_0.cubicTo(
      size.width * 0.03102524,
      size.height * 0.5214089,
      size.width * 0.03102016,
      size.height * 0.4883036,
      size.width * 0.04508365,
      size.height * 0.4616446);
  path_0.lineTo(size.width * 0.2402794, size.height * 0.09161786);
  path_0.close();

  return path_0;
}
