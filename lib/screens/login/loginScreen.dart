import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/gradientbg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  List<Color> listOfColors = [
    Color(0xFFB62E59).withOpacity(0.5),
    Color(0x00000000)
  ];

  Future<bool> _rememberMeSP([bool changeValue]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _rememberSP;

    if (changeValue == null){ //if function called but not changed, get value from SP
      _rememberSP = prefs.getBool('rememberMe');
    }
    if(changeValue != null){ //if function called to change, set SP to new value
      _rememberSP = changeValue;
      prefs.setBool('rememberMe', changeValue);
    }

    if(_rememberSP == null){ //if no value set, default to false
      prefs.setBool('rememberMe', false);
      _rememberSP = false;
    }

    return _rememberSP; //always return current value
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
          child: TextField(
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
          child: TextField(
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

  Future <Widget> _buildRememberMeCheckbox() async {
    bool _rememberMe = await _rememberMeSP();
    return Container(
        child: Row(
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: _rememberMe,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: (value) => _rememberMeSP(value),
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
    ));
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () => print("login button pressed"),
        elevation: 5.0,
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
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
                  _buildForgotPasswordBtn(),
                  _buildRememberMeCheckbox(),
                  _buildLoginBtn(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
