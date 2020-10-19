import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/app.dart';
import 'package:hello/observer.dart';

void main() {
  Bloc.observer = BeerBlocObserver();
  runApp(MyApp());
}


