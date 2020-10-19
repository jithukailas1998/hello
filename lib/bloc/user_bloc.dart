import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/bloc/user_event.dart';
import 'package:hello/bloc/user_state.dart';
import 'package:hello/models/model.dart';
import 'package:hello/repos/repository.dart';
import 'package:http/http.dart' as http;

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  int page = 1;
  bool isFetching = false;

  UserBloc({
    @required this.userRepository,
  }) : super(UserInitialState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserFetchEvent) {
      yield UserLoadingState(message: 'Loading...');
      final response = await userRepository.getUsers(page: page);
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final users = jsonDecode(response.body) as List;
          yield UserSuccessState(
            users: users.map((user) => UserModel.fromJson(user)).toList(),
          );
          //page++;
        } else {
          yield UserErrorState(error: response.body);
        }
      } else if (response is String) {
        yield UserErrorState(error: response);
      }
    }
  }
}