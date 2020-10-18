import 'package:flutter/foundation.dart';
import 'package:hello/models/model.dart';

abstract class UserState {
  const UserState();
}

class UserInitialState extends UserState {
  const UserInitialState();
}

class UserLoadingState extends UserState {
  final String message;

  const UserLoadingState({
    @required this.message,
  });
}

class UserSuccessState extends UserState {
  final List<UserModel> users;

  const UserSuccessState({
    @required this.users,
  });
}

class UserErrorState extends UserState {
  final String error;

  const UserErrorState({
    @required this.error,
  });
}