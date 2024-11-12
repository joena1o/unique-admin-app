import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/responsive.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool collapsed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: Responsive.isExtraLarge(context) ? 2 : 3,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Responsive.getSize(context).height * .1,
            ),
            GestureDetector(
                onTap: () {
                  context.go("/home");
                },
                child: const ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Dashboard"),
                )),
            const SizedBox(
              height: 10,
            ),
            ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 15),
              childrenPadding:
                  const EdgeInsets.only(left: 35, top: 15, bottom: 20),
              dense: false,
              leading: const Icon(Icons.shopping_bag),
              title: const Text(
                'Product',
              ),
              backgroundColor: AppColors.lightColor,
              onExpansionChanged: (bool expanding) {
                setState(() {
                  collapsed = !collapsed;
                });
              },
              trailing: collapsed
                  ? const Icon(Icons.keyboard_arrow_up)
                  : const Icon(Icons.keyboard_arrow_down),
              children: [
                GestureDetector(
                  onTap: () {
                    context.go("/order-history");
                  },
                  child: ListTile(
                      title: Text(
                    "Order History",
                    style: FontClass.navFontBlackNoSpace,
                  )),
                ),
                ListTile(
                    title: Text(
                  "Products",
                  style: FontClass.navFontBlackNoSpace,
                )),
                ListTile(
                    title: Text(
                  "Add Product",
                  style: FontClass.navFontBlackNoSpace,
                )),
                ListTile(
                    title: Text(
                  "Reviews",
                  style: FontClass.navFontBlackNoSpace,
                )),
              ], // Use the state list to determine the icon
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(Icons.people),
              title: Text("Users"),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: UtilityClass.horizontalAndVerticalPadding,
              child: const Divider(),
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text("Help"),
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
