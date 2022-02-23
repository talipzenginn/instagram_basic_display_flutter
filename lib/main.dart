import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'core/utils/routes.gr.dart';
import 'package:get_it/get_it.dart';

void main() {
  getIt.registerSingleton<AppRouter>(AppRouter());

  runApp(const MyApp());
}

final getIt = GetIt.instance;

final router = getIt<AppRouter>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AutoRouterDelegate(router),
      routeInformationParser: router.defaultRouteParser(),    
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
