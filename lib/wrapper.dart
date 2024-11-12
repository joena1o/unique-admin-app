import 'package:flutter/material.dart';
import 'package:unique_admin_application/features/auth/presentation/pages/auth_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return const AuthScreen();
  }
}
