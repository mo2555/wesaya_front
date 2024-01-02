import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/di/di.dart';
import 'core/helpers/provider_helper.dart';
import 'core/utils/app_constants.dart';
import 'features/home/presentation/views/home_view.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  runApp(
    MultiProvider(
      providers: ProviderHelper.providers,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
