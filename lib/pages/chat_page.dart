import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supply_hero_web/services/services.dart';
import 'package:supply_hero_web/shared/shared.dart';
import 'package:supply_hero_web/widgets/widgets.dart';

import 'login_page.dart';

class ChatPage extends StatefulWidget {
  static const String chatPageRoute = 'chatPageRoute';
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  FirestoreService _firestoreService = FirestoreService();
  final _authService = AuthService();

  final _formKey = GlobalKey<FormState>();
  bool _showChat = true;
  String _message = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        children: [
          if (!_showChat) _openChatWidget(),
          if (_showChat) _chatWidget(),
        ],
      ),
    );
  }

  Widget _chatWidget() {
    return Positioned(
      bottom: 12.0,
      right: 12.0,
      child: Container(
        child: Scaffold(
          appBar: _chatAppBar(),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MessageListWidget(),
                Container(
                  decoration: AppStyle.kMessageInputContainerDecoration,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: Material(
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _message = value;
                                });
                              },
                              decoration:
                                  AppStyle.kMessageTextFieldDecoration.copyWith(
                                hintStyle: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          _firestoreService.sendMessage(_message);
                          setState(() {
                            _formKey.currentState.reset();
                          });
                        },
                        child: Icon(
                          Icons.send,
                          color: _message == ''
                              ? Colors.grey
                              : AppStyle.kHeroRedColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      width: 300,
      height: 300,
    );
  }

  Widget _openChatWidget() {
    return Positioned(
      bottom: 12.0,
      right: 12.0,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              color: AppStyle.kHeroRedColor, shape: BoxShape.circle),
          width: 70,
          height: 70,
          child: CustomPaint(
            painter: CustomChatAvatar(),
          ),
        ),
        onTap: () {
          setState(() {
            _showChat = true;
          });
        },
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
        child: Container(
          color: AppStyle.kHeroRedColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Supply Hero',
                  style: GoogleFonts.ralewayDots(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
              Text(
                'Logged in as ${_authService.user.email == SUPPLIER_EMAIL ? 'John Supp' : 'Anna Sandwich'}',
                style: GoogleFonts.ralewayDots(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
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
                  })
            ],
          ),
        ),
        preferredSize: Size.fromHeight(300));
  }

  PreferredSize _chatAppBar() {
    return PreferredSize(
        child: Container(
          decoration: BoxDecoration(
              color: AppStyle.kHeroRedColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0))),
          child: ListTile(
            leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomPaint(
                  child: Container(
                    width: 40,
                    height: 40,
                  ),
                  painter: CustomChatAvatar(),
                )),
            title: Text(
              _authService.user.email == SUPPLIER_EMAIL ?  'King Resto' : 'Supply Express' ,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            subtitle: Text(
              _authService.user.email == SUPPLIER_EMAIL ?  'Anna Sandwich' :'John Supp',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
            ),
            trailing: GestureDetector(
              child: CustomCloseWidget(),
              onTap: () => setState(() {
                _showChat = false;
              }),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(300));
  }
}
