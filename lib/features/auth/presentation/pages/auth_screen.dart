import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/core/app_routes.dart';
import 'package:unique_admin_application/features/auth/presentation/provider/auth_provider.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/responsive.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Responsive.isMobile(context)
                    ? Responsive.getSize(context).width * .7
                    : Responsive.isMobile(context)
                        ? Responsive.getSize(context).width * .6
                        : Responsive.getSize(context).width * .4,
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
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        final RegExp regex = RegExp(UtilityClass.emailPattern);
                        if (!regex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      controller: email,
                      decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Enter your email address"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text("Password"),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: password,
                      decoration: const InputDecoration(
                          labelText: "Enter your password"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<AuthProvider>(builder: (context, provider, child) {
                      return !provider.signingUser
                          ? Padding(
                              padding: UtilityClass.verticalPadding,
                              child: Container(
                                height: 50,
                                width: Responsive.getSize(context).width,
                                decoration: UtilityClass.setButtonDecoration(
                                    AppColors.darkColor),
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        provider.signInUser(
                                            email.text,
                                            password.text,
                                            () => context.go(AppRoutes.home));
                                      }
                                    },
                                    child: Text(
                                      "Login",
                                      style: FontClass.buttonStyleWhite,
                                    )),
                              ),
                            )
                          : const Center(child: CircularProgressIndicator());
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
