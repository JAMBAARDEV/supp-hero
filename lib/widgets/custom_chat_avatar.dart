import 'package:flutter/material.dart';
import 'package:supply_hero_web/shared/shared.dart';

class CustomChatAvatar extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 1.1
      ..style = PaintingStyle.stroke
      ..color = Colors.white70;
    canvas.drawCircle(
        Offset(size.width / 2, size.width / 2), size.width / 2, paint);

    Paint paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    Rect rect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width /2,
        height: size.height / 3);
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(10.0));
    canvas.drawRRect(rrect, paint2);

    Path path = Path();
    List<Offset> trianglePoints =[
      Offset(size.width/4, size.height/2,),
      Offset(size.width/4, size.height*3/4),
      Offset(size.width/2,  size.height/2),
    ];
    path.addPolygon(trianglePoints, true);
    canvas.drawPath(path, paint2);
    Paint paintRedPoint = Paint()..color = AppStyle.kHeroRedColor;
    canvas.drawCircle(Offset(size.width*5/12, size.height/2), size.width/25, paintRedPoint);
    canvas.drawCircle(Offset(size.width*7/12, size.height/2), size.width/25, paintRedPoint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
