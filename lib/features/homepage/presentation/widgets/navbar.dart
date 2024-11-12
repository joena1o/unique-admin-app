import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/utils/responsive.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key, required this.drawerMenu});

  final Function drawerMenu;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
            visible: !Responsive.isDesktop(context),
            child: IconButton(
                onPressed: () {
                  drawerMenu();
                },
                icon: const Icon(Icons.menu))),
        const Spacer(),
        Visibility(
          visible: !(Responsive.isMobile(context)),
          child: Container(
            width: (Responsive.isDesktop(context)) ? 300 : 150,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.lightColor,
                borderRadius: BorderRadius.circular(100)),
            child: TextFormField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  labelStyle: TextStyle(fontSize: 12),
                  labelText: "Search"),
            ),
          ),
        ),
        if (Responsive.isDesktop(context))
          const SizedBox(
            width: 40,
          ),
        if (Responsive.isDesktop(context))
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.lightColor,
                  borderRadius: BorderRadius.circular(100)),
              child: const Row(
                children: [
                  Text("You have 21 notifications"),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.notifications)
                ],
              )),
        const SizedBox(
          width: 40,
        ),
        const SizedBox(
          width: 20,
        ),
        CircleAvatar(
          backgroundColor: AppColors.lightColor,
          child: const Icon(
            Icons.person,
          ),
        ),
      ],
    );
  }
}
