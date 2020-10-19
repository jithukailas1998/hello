import 'package:flutter_bloc/flutter_bloc.dart';

class BeerBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    //print(event);
    super.onEvent(bloc, event);
  }
}