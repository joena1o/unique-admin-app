import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/responsive.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.lightColor,
        ),
        alignment: Alignment.center,
        width: Responsive.getSize(context).width,
        height: Responsive.getSize(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Responsive.getSize(context).width * .3,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: FontClass.headerStyleBlack,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Email Address"),
                  const SizedBox(
                    height: 5,
                  ),
                  const TextField(
                    decoration:
                        InputDecoration(labelText: "Enter your email address"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Password"),
                  const SizedBox(
                    height: 5,
                  ),
                  const TextField(
                    decoration:
                        InputDecoration(labelText: "Enter your password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: UtilityClass.verticalPadding,
                    child: Container(
                      height: 46,
                      width: Responsive.getSize(context).width,
                      decoration:
                          UtilityClass.setButtonDecoration(AppColors.darkColor),
                      child: ElevatedButton(
                          onPressed: () {
                            context.go("/home");
                          },
                          child: Text(
                            "Login",
                            style: FontClass.buttonStyleWhite,
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
