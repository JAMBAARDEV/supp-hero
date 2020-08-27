import 'package:flutter/material.dart';

class AppStyle {

  static const Map<int, Color> kHeroRedColorMap =
  {
    50:Color.fromRGBO(214, 31, 38, .1),
    100:Color.fromRGBO(214, 31, 38, .2),
    200:Color.fromRGBO(214, 31, 38, .3),
    300:Color.fromRGBO(214, 31, 38, .4),
    400:Color.fromRGBO(214, 31, 38, .5),
    500:Color.fromRGBO(214, 31, 38, .6),
    600:Color.fromRGBO(214, 31, 38, .7),
    700:Color.fromRGBO(214, 31, 38, .8),
    800:Color.fromRGBO(214, 31, 38, .9),
    900:Color.fromRGBO(214, 31, 38, 1),
  };
  static const MaterialColor kHeroRedPrimarySwatch = MaterialColor(0xFFD61F26, kHeroRedColorMap);
  static const Color kHeroRedColor = Color(0xFFD61F26);
  static const Color kHeroGreyColor = Color(0xFFF4F6F6);


  //App Login Page

  static const kLoginTextInputDecoration =
  InputDecoration(

    hintStyle: TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.italic
    ),
    contentPadding:
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.white, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.white, width: 2.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.amber, width: 1.0),
    ),
    errorStyle: TextStyle(
        color: Colors.amber
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.amber, width: 1.0),
    ),
  );

// App Message Page
  static const kMessageTextFieldDecoration = InputDecoration(

    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'Type a message ...',
    border: InputBorder.none,
  );

  static const kMessageInputContainerDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(color: Colors.grey, width: 1.0),
    ),
  );

  static const kMessageBubbleBorderRadius = Radius.circular(28.0);

  static const kMessageSendButtonTextStyle = TextStyle(
    color: kHeroRedColor,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

}
