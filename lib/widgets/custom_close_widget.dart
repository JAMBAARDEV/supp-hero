import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCloseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        width: 12.0,
        height: 12.0,
      ),
     // size: Size.fromWidth(70),
      painter: CustomClosePainter(
      ),
    );
  }
}

class CustomClosePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white
    ..strokeWidth = 1.0;
    canvas.drawLine(Offset.zero, Offset(size.width, size.width), paint);
    canvas.drawLine(Offset(size.width, 0.0 ), Offset(0.0, size.width), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
