import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unique_admin_application/core/app_routes.dart';
import 'package:unique_admin_application/core/config/app_theme.dart';
// ignore: depend_on_referenced_packages
//import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:unique_admin_application/core/config/get_it_setup.dart';
import 'package:unique_admin_application/data/repository/auth_repository.dart';
import 'package:unique_admin_application/data/repository/product_repository.dart';
import 'package:unique_admin_application/features/auth/presentation/provider/auth_provider.dart';
import 'package:unique_admin_application/features/homepage/presentation/provider/home_provider.dart';
import 'package:unique_admin_application/features/products/presentation/provider/product_provider.dart';
import 'package:unique_admin_application/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //setUrlStrategy(PathUrlStrategy());
  setUpLocator();
  runApp(const MyApp());
}

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                AuthProvider(authRepository: getIt<AuthRepository>())),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(
            create: (context) =>
                ProductProvider(productRepository: getIt<ProductRepository>())),
      ],
      child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(
                  1.0)), // Set to 1.0 to prevent scaling
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            scaffoldMessengerKey: rootScaffoldMessengerKey,
            title: 'Unique Admin App',
            theme: MainAppTheme.lightTheme,
          )),
    );
  }
}
