import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/helper/cache_data/cache_data.dart';
import 'package:shopping_app/feature/favorite/data/favorite_data.dart';
import 'bloc_observer/app_bloc_observer.dart';
import 'my_app.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref.init();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
    // MyApp(),
  );
}
