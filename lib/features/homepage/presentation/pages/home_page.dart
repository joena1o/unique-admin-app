import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/features/homepage/presentation/provider/home_provider.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/navbar.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/sidebar.dart';
import 'package:unique_admin_application/features/products/presentation/provider/product_provider.dart';
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
  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().fetchProducts();
    context
        .read<HomeProvider>()
        .setDrawerFunction(() => _scaffoldKey.currentState?.closeDrawer());
  }

  bool collapsed = false;
  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouter.of(context).location.split("/")[1];
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          shape: const RoundedRectangleBorder(),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: const Sidebar(),
        ),
        backgroundColor: AppColors.borderGray,
        body: Container(
          padding: Responsive.isMobile(context)
              ? UtilityClass.verticalPaddingHalf
              : UtilityClass.horizontalAndVerticalPadding,
          child: Row(
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                    flex: Responsive.isExtraLarge(context) ? 2 : 3,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.lightColor),
                        child: const Sidebar())),
              Expanded(
                flex: 10,
                child: Container(
                  padding: UtilityClass.horizontalAndVerticalPadding,
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
                            if (UtilityClass.formatRouteName(currentPath) !=
                                "Home")
                              BreadCrumbItem(
                                  content: Text(UtilityClass.formatRouteName(
                                      currentPath))),
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
