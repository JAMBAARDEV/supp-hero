import 'package:flutter/material.dart';
import 'package:supply_hero_web/pages/pages.dart';
import 'package:supply_hero_web/shared/shared.dart';
import '../services/auth_service.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  const AppBarWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authService = AuthService();
    return AppBar(
      title: title,
      backgroundColor:  AppStyle.kHeroRedColor,
      actions: [
        IconButton(
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.white,
            ),
            onPressed: () {
              _authService.logout(context);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage(),
                ),
                    (Route route) => false,
              );
            }),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.0);
}
