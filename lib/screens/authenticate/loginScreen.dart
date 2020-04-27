import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mao_trailer_app/components/gradientbg.dart';
import 'package:mao_trailer_app/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {

  final Function toggleView;
  LoginScreen({this.toggleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //list of colors
  List<Color> listOfColors = [
    Color(0xFFB62E59).withOpacity(0.5),
    Color(0x00000000)
  ];

  //authService
  final AuthService _auth = AuthService();

  //formkey
  final _formkey = GlobalKey<FormState>();

  //textfield state
  String email = '';
  String password = '';
  String error = '';



  Future<bool> _rememberMeSP([bool changeValue]) async {
    final prefs = await SharedPreferences.getInstance();
    final rememberMe = prefs.getBool('rememberMe');

    if (rememberMe == null) {
      //if no recorded value for firstTimeOpened
      prefs.setBool('rememberMe', false); //if null, set to false
    }
    if (changeValue != null) {
      //if new value passed, set new value and return
      prefs.setBool('rememberMe', changeValue);
      return changeValue;
    }

    return rememberMe; //always return current value
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            onChanged: (val) {
              setState(() => email = val);
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: "Enter your Email",
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            onChanged: (val) {
              setState(() => password = val);
            },
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: "Enter your Password",
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("forgot button pressed"),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _rememberMeCheckbox(bool rememberMeSP) {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: rememberMeSP,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMeSP(value);
                });
              }, //update shared preferences
            ),
          ),
          Text(
            'Remember me',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
          ),
        ],
      ),
    );
  }

  FutureBuilder _buildRememberMeCheckbox() {
    return FutureBuilder<bool>(
      future: _rememberMeSP(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        Widget checkbox;

        if (snapshot.hasData) {
          checkbox = _rememberMeCheckbox(snapshot.data);
        } else {
          checkbox = _rememberMeCheckbox(false);
        }
        return checkbox;
      },
    );
  }

  Widget _buildSignInBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,

      child: SignInButton(
        Buttons.Email,
        onPressed: () async {
          if (_formkey.currentState.validate()){
            dynamic result = await _auth.logInWithEmailAndPassword(email, password);
            print('result: $result');
            if (result == null){
              setState(() => error = 'please supply a valid email/password that has not already been registered');
            }
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        

      ),
    );
  }

Widget _buildSignInWithGoogleBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      child: SignInButton(
        Buttons.Google,
        onPressed: () async {
          dynamic result = await _auth.googleSignIn();
          print('Google result: $result');
          if (result == null){
            setState(() => error = 'please supply a valid email/password that has not already been registered');
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }


  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      child: SignInButton(
        Buttons.Email,
        onPressed: ()  {
          widget.toggleView();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        text: 'Register with Email',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: gradientbg(listOfColors)),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Form (
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(height: 30.0),
                    _buildEmailTF(),
                    SizedBox(height: 30.0),
                    _buildPasswordTF(),
                    Row(
                      children: <Widget>[
                        _buildRememberMeCheckbox(),
                        SizedBox(width: 25),
                        _buildForgotPasswordBtn(),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      child: Text(error, style: TextStyle(color: Colors.white, fontSize: 14),)
                    ),
                    _buildSignInBtn(),
                    _buildSignInWithGoogleBtn(),
                    _buildRegisterBtn(),
                    
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
