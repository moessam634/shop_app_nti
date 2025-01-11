import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'bloc_observer/app_bloc_observer.dart';
import 'my_app.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
