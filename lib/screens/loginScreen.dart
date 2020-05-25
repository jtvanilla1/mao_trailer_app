import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mao_trailer_app/theme/gradientbg.dart';
import 'package:mao_trailer_app/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  //secure storage for login information
  final _secureStorage = FlutterSecureStorage();

  //formkey
  final _formkey = GlobalKey<FormState>();

  //textfield state
  String email;
  String password;
  String error = '';
  bool _rememberMe;
  SharedPreferences _prefs;
  _SecItem loginInfo;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _prefs = await SharedPreferences.getInstance();
      _rememberMe = _prefs.getBool('rememberMe');

      loginInfo = await _readFromStorage();
      print(loginInfo);
      //if existing login information, load it to mainframe
      if (loginInfo != null) {
        email = loginInfo._getEmail();
        password = loginInfo._getPassWord();
      }
      //if no existing login information, create blank info screen
      else if (loginInfo == null) {
        email = '';
        password = '';
        loginInfo = _SecItem(email, password);
      }

      
      print('sign in screen loaded. current details: $email, $password');
    });
    super.initState();
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
              child: Form(
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
                        child: Text(
                          error,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
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

  _addLoginToStorage(_SecItem secItem) async {
    await _secureStorage.write(key: secItem.email, value: secItem.password);
  }

  Future<_SecItem> _readFromStorage() async {
    final all = await _secureStorage.readAll();
    final _items = all.keys.map((e) => _SecItem(e, all[e]));
    return _items.elementAt(0);
  }

  _deleteAllFromStorage() async {
    await _secureStorage.deleteAll();
  }

  Future<bool> _rememberMeSP([bool changeValue]) async {
    _rememberMe = _prefs.getBool('rememberMe');
    if (_rememberMe == null) {
      //if no recorded value for firstTimeOpened
      _prefs.setBool('rememberMe', false); //if null, set to false
    }
    if (changeValue != null) {
      //if new value passed, set new value and return
      _prefs.setBool('rememberMe', changeValue);
      return changeValue;
    }

    return _rememberMe; //always return current value
  }

  Widget _buildEmailTF() {
    String initValue = email;

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
            initialValue: initValue,
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
    String initValue = password;

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
            initialValue: initValue,
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
          //record login information in secure storage
          if (_rememberMe) {
            loginInfo = _SecItem(email, password);
            print(
                'new login info: ${loginInfo._getEmail()}, ${loginInfo._getPassWord()}');

            //delete previous entries and update with new login value
            _deleteAllFromStorage();
            _addLoginToStorage(loginInfo);
          } else {
            print('deleting info from storage');
            _deleteAllFromStorage();
          }
          //validate information
          if (_formkey.currentState.validate()) {
            dynamic result =
                await _auth.logInWithEmailAndPassword(email, password);
            print('result: $result');
            if (result == null) {
              setState(() => error =
                  'please supply a valid email/password that has not already been registered');
            }
          }
        },
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
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
          if (result == null) {
            setState(() => error =
                'please supply a valid email/password that has not already been registered');
          }
        },
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      child: SignInButton(
        Buttons.Email,
        onPressed: () {
          widget.toggleView();
        },
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        text: 'Register with Email',
      ),
    );
  }
}

class _SecItem {
  _SecItem(this.email, this.password);
  final String email;
  final String password;

  String _getEmail() {
    return email;
  }

  String _getPassWord() {
    return password;
  }
}
