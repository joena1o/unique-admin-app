import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/core/app_routes.dart';
import 'package:unique_admin_application/features/homepage/presentation/provider/home_provider.dart';
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
    return Padding(
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
                context.read<HomeProvider>().closeDrawer();
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
                  context.go(AppRoutes.orderHistory);
                  context.read<HomeProvider>().closeDrawer();
                },
                child: const ListTile(
                    title: Text(
                  "Order History",
                )),
              ),
              GestureDetector(
                onTap: () {
                  context.go(AppRoutes.products);
                  context.read<HomeProvider>().closeDrawer();
                },
                child: const ListTile(
                    title: Text(
                  "Products",
                )),
              ),
              GestureDetector(
                onTap: () {
                  context.go(AppRoutes.productCategory);
                  context.read<HomeProvider>().closeDrawer();
                },
                child: const ListTile(
                    title: Text(
                  "Product Category",
                )),
              ),
              GestureDetector(
                onTap: () {
                  context.go(AppRoutes.addProduct);
                  context.read<HomeProvider>().closeDrawer();
                },
                child: const ListTile(
                    title: Text(
                  "Add Product",
                )),
              ),
              GestureDetector(
                onTap: () {
                  context.go(AppRoutes.reviews);
                  context.read<HomeProvider>().closeDrawer();
                },
                child: const ListTile(
                    title: Text(
                  "Reviews",
                )),
              ),
            ], // Use the state list to determine the icon
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              context.go(AppRoutes.users);
              context.read<HomeProvider>().closeDrawer();
            },
            child: const ListTile(
              leading: Icon(Icons.people),
              title: Text("Users"),
            ),
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
          GestureDetector(
            onTap: () {
              context.go("/login");
              context.read<HomeProvider>().closeDrawer();
            },
            child: const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
