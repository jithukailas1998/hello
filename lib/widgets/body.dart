import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/bloc/user_bloc.dart';
import 'package:hello/bloc/user_event.dart';
import 'package:hello/bloc/user_state.dart';
import 'package:hello/models/model.dart';
import 'package:hello/widgets/list_item.dart';
import 'package:hello/widgets/loader.dart';

class UserBody extends StatelessWidget {
  final List<UserModel> _users = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, userState) {
          if (userState is UserLoadingState) {
            ShimmerLoader();
            // Scaffold.of(context)
            //     .showSnackBar(SnackBar(content: Text(userState.message)));
          } else if (userState is UserSuccessState && userState.users.isEmpty) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('No more users')));
          } else if (userState is UserErrorState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(userState.error)));
            context.bloc<UserBloc>().isFetching = false;
          }
          return;
        },
        builder: (context, userState) {
          if (userState is UserInitialState ||
              UserState is UserLoadingState && _users.isEmpty) {
            return CircularProgressIndicator();
          } else if (userState is UserSuccessState) {
            _users.addAll(userState.users);
            context.bloc<UserBloc>().isFetching = false;
            Scaffold.of(context).hideCurrentSnackBar();
          } else if (userState is UserErrorState && _users.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.bloc<UserBloc>()
                      ..isFetching = true
                      ..add(UserFetchEvent());
                  },
                  icon: Icon(Icons.refresh),
                ),
                const SizedBox(height: 15),
                Text(userState.error, textAlign: TextAlign.center),
              ],
            );
          }
          return ListView.separated(
            controller: _scrollController
              ..addListener(() {
                if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent &&
                    !context.bloc<UserBloc>().isFetching) {
                  context.bloc<UserBloc>()
                    ..isFetching = true
                    ..add(UserFetchEvent());
                }
              }),
            itemBuilder: (context, index) => UserItems(_users[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemCount: _users.length,
          );
        },
      ),
    );
  }
}