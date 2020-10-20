import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/bloc/user_bloc.dart';
import 'package:hello/bloc/user_event.dart';
import 'package:hello/repos/repository.dart';
import 'package:hello/widgets/body.dart';
import 'package:hello/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        userRepository: UserRepository(),
      )..add(UserFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users'),
          backgroundColor: Colors.green,
          actions: <Widget>[
            new IconButton(
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('value');
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
        body: UserBody(),
      ),
    );
  }
}
