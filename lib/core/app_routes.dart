import 'package:go_router/go_router.dart';
import 'package:unique_admin_application/features/homepage/presentation/pages/home_page.dart';
import 'package:unique_admin_application/features/homepage/presentation/tabs/dashboard_tab.dart';
import 'package:unique_admin_application/features/homepage/presentation/tabs/order_tab.dart';
import 'package:unique_admin_application/wrapper.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const NoTransitionPage(child: Wrapper()),
    ),
    ShellRoute(
      builder: (context, state, child) => HomeScreen(child: child),
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: DashboardTab()),
        ),
        GoRoute(
          path: '/order-history',
          name: 'order-history',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: OrderTab()),
        ),
      ],
    ),
  ],
);

GoRouter get router => _router;
