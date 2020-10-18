import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hello/widgets/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String email;
  String password;
  int _loginValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (val) =>
                              !EmailValidator.validate(val, true)
                                  ? 'Not a valid email.'
                                  : null,
                          onSaved: (val) => email = val,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          validator: (val) =>
                              val.length < 4 ? 'Password too short..' : null,
                          onSaved: (val) => password = val,
                          obscureText: true,
                        ),
                        RaisedButton(
                          onPressed: () {
                            _submit(0);
                          },
                          child: Text('Sign in'),
                        ),
                      ],
                    ))
              ],
            )),
      ),
    );
  }

  void _submit(int x) async {
    final form = formKey.currentState;
    if (form.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      form.save();
      _loginValue = x;
      prefs.setInt('value', _loginValue);
      print("Login value = $_loginValue");
      _login();
    }
  }

  void _login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}
