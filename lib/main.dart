import 'package:flutter/material.dart';

import 'pages/pages.dart';
import 'shared/shared.dart';

void main() {
  runApp(SupplyHeroWebApp());
}

class SupplyHeroWebApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supply Hero',
      theme: ThemeData(
        primarySwatch: AppStyle.kHeroRedPrimarySwatch,
      ),
      initialRoute: LoginPage.loginPageRoute,
      routes: {
        LoginPage.loginPageRoute: (context) => LoginPage(),
        ChatPage.chatPageRoute: (context) => ChatPage(),
      },
    );
  }
}
