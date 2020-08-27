import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supply_hero_web/shared/shared.dart';
import '../models/models.dart';

class MessageBubbleWidget extends StatelessWidget {
  final ChatMessageModel message;
  final int position;
  final bool isMine;
  MessageBubbleWidget({this.message, this.isMine, this.position} );

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start, children: [
      Container(
        padding: EdgeInsets.all(10.0),
        child: Material(
          color: isMine ? AppStyle.kHeroRedColor : AppStyle.kHeroGreyColor,
          borderRadius: isMine ? BorderRadius.only(
              topRight: AppStyle.kMessageBubbleBorderRadius,
              bottomLeft: AppStyle.kMessageBubbleBorderRadius,
              topLeft: AppStyle.kMessageBubbleBorderRadius)
              :
          BorderRadius.only(
              topLeft: AppStyle.kMessageBubbleBorderRadius,
              topRight: AppStyle.kMessageBubbleBorderRadius,
              bottomRight: AppStyle.kMessageBubbleBorderRadius),
          elevation: 3,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Text(
              message.message,
              style: GoogleFonts.roboto(
                color: isMine ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w300
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
