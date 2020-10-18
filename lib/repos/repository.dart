import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static final UserRepository _userRepository = UserRepository._();
  static const int _perPage = 10;

  UserRepository._();

  factory UserRepository() {
    return _userRepository;
  }

  Future<dynamic> getUsers({
    @required int page,
  }) async {
    try {
      return await http.get(
        'https://jsonplaceholder.typicode.com/todos?page=$page&per_page=$_perPage',
      );
    } catch (e) {
      return e.toString();
    }
  }
}