import 'package:go_router/go_router.dart';
import 'package:unique_admin_application/features/add_product/presentation/pages/add_product.dart';
import 'package:unique_admin_application/features/homepage/presentation/pages/home_page.dart';
import 'package:unique_admin_application/features/homepage/presentation/tabs/dashboard_tab.dart';
import 'package:unique_admin_application/features/homepage/presentation/tabs/order_tab.dart';
import 'package:unique_admin_application/features/homepage/presentation/tabs/review_tab.dart';
import 'package:unique_admin_application/features/homepage/presentation/tabs/users_tab.dart';
import 'package:unique_admin_application/features/products/presentation/pages/edit_products.dart';
import 'package:unique_admin_application/features/products/presentation/pages/products.dart';
import 'package:unique_admin_application/wrapper.dart';

class AppRoutes {
  static String initial = "/login";
  static String home = "/home";
  static String orderHistory = "/order-history";
  static String addProduct = "/add-product";
  static String products = "/products";
  static String editProducts = "/edit-product";
  static String users = "/users";
  static String reviews = "/reviews";
}

final GoRouter _router = GoRouter(
  initialLocation: AppRoutes.initial,
  routes: [
    GoRoute(
      path: AppRoutes.initial,
      pageBuilder: (context, state) => const NoTransitionPage(child: Wrapper()),
    ),
    ShellRoute(
      builder: (context, state, child) => HomeScreen(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          name: 'home',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: DashboardTab()),
        ),
        GoRoute(
          path: AppRoutes.orderHistory,
          name: 'order-history',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: OrderTab()),
        ),
        GoRoute(
          path: AppRoutes.addProduct,
          name: 'add-product',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AddProduct()),
        ),
        GoRoute(
          path: AppRoutes.products,
          name: 'products',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ProductPage()),
        ),
        GoRoute(
          path: AppRoutes.editProducts,
          name: 'edit-products',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: EditProduct()),
        ),
        GoRoute(
          path: AppRoutes.users,
          name: 'users',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: UsersTab()),
        ),
        GoRoute(
          path: AppRoutes.reviews,
          name: 'reviews',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ReviewTab()),
        ),
      ],
    ),
  ],
);

GoRouter get router => _router;
