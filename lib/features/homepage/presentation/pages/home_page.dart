import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:go_router/go_router.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/navbar.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/sidebar.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/responsive.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.child});

  final Widget child;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  bool collapsed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        shape: const RoundedRectangleBorder(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    context.pop();
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
                      context.pop();
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
      ),
      backgroundColor: AppColors.borderGray,
      body: Container(
        padding: UtilityClass.horizontalAndVerticalPadding,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.lightColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              if (Responsive.isDesktop(context)) const Sidebar(),
              Expanded(
                flex: 10,
                child: Container(
                  padding: UtilityClass.horizontalAndVerticalPadding,
                  color: AppColors.borderGray,
                  child: Column(
                    children: [
                      Padding(
                        padding: UtilityClass.horizontalPadding,
                        child: Navbar(
                          drawerMenu: () =>
                              _scaffoldKey.currentState?.openDrawer(),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        alignment: Alignment.centerLeft,
                        child: BreadCrumb(
                          items: <BreadCrumbItem>[
                            BreadCrumbItem(content: const Text('Home')),
                            BreadCrumbItem(content: const Text('Products')),
                          ],
                          divider: Icon(
                            Icons.chevron_right,
                            color: AppColors.borderGray,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(child: widget.child)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
