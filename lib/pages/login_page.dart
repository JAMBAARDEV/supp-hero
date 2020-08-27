import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supply_hero_web/pages/pages.dart';
import 'package:supply_hero_web/services/services.dart';
import 'package:supply_hero_web/shared/shared.dart';
import '../models/models.dart';

class LoginPage extends StatefulWidget {
  static const String loginPageRoute = 'loginPageRoute';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthService _authService = AuthService();
  UserModel _user = UserModel();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _formValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppStyle.kHeroRedColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          onChanged: () => setState(() => _formValid = _formKey.currentState.validate()),
          autovalidate: _formValid,
          child: Center(
            child: Container(
              width: 300,
              height: 700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Supply Hero',
                        style: GoogleFonts.ralewayDots(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    _emailInput(),
                    SizedBox(
                      height: 8.0,
                    ),
                    _passwordInput(),
                    SizedBox(
                      height: 7.0,
                    ),
                    MaterialButton(
                      onPressed: _formValid
                          ? () async{
                        print('Form Valid');
                      bool loginResult = await _authService.login(_user);
                      if(loginResult){
                        Navigator.pushReplacementNamed(
                            context, ChatPage.chatPageRoute);
                      }
                        _displayLoginErrorSnackBar(context);
                      }
                          : null,
                      color: Colors.white,
                      elevation: 7.0,
                      disabledElevation: 1.0,
                      disabledColor: Colors.white70,
                      child: Text(
                        'Log In',
                        style: TextStyle(color: AppStyle.kHeroRedColor),
                      ),
                    ),
                  ],
                ),

            ),
          ),
        ),
      ),
    );
  }

  Widget _emailInput() {
    return TextFormField(
      onChanged: (value) {
        _user.email = value;
      },
      style: GoogleFonts.ralewayDots(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      decoration: AppStyle.kLoginTextInputDecoration
          .copyWith(hintText: 'Enter your email...'),
      validator: Utils.validateEmail,
      onSaved: (String value) {
        _user.email = value;
      },
    );
  }

  Widget _passwordInput() {
    return TextFormField(
      onEditingComplete: ()=> print('Editing done'),
      onChanged: (value) {
        _user.password = value;
      },
      obscureText: true,
      style: GoogleFonts.ralewayDots(
          color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
      decoration: AppStyle.kLoginTextInputDecoration
          .copyWith(hintText: 'Enter your password...'),
      validator: Utils.validatePassword,
      onSaved: (String value) {
        _user.password = value;
      },
    );
  }

  _displayLoginErrorSnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Please Provide valid Credentials'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

}
