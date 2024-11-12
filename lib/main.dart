import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/app_routes.dart';
import 'package:unique_admin_application/core/config/app_theme.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
            textScaler:
                const TextScaler.linear(1.0)), // Set to 1.0 to prevent scaling
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          title: 'Flutter Demo',
          theme: MainAppTheme.lightTheme,
        ));
  }
}
