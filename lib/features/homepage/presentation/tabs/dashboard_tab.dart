import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/activity_widget.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/dashboard_charts.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/notifications_widget.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/orders_table.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/sales_chart.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/stats_card_item.dart';
import 'package:unique_admin_application/utils/responsive.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Responsive.isExtraLarge(context)
                ? Row(
                    children: [
                      Expanded(
                        child: StatCardItem(
                          color: AppColors.oranage,
                          item: "Sales",
                          value: "250K",
                          icon: Icons.pie_chart_outline,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: StatCardItem(
                          color: AppColors.blue!,
                          item: "Customers",
                          value: "250K",
                          icon: Icons.emoji_emotions,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: StatCardItem(
                          color: AppColors.yellowColor!,
                          item: "Products",
                          value: "100",
                          icon: Icons.add_box,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: StatCardItem(
                          color: AppColors.green,
                          item: "Revenue",
                          value: "\$100m",
                          icon: Icons.add_box,
                        ),
                      ),
                    ],
                  )
                : Responsive.isMobile(context)
                    ? Column(
                        children: [
                          StatCardItem(
                            color: AppColors.oranage,
                            item: "Sales",
                            value: "250K",
                            icon: Icons.pie_chart_outline,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          StatCardItem(
                            color: AppColors.blue!,
                            item: "Customers",
                            value: "250K",
                            icon: Icons.emoji_emotions,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          StatCardItem(
                            color: AppColors.yellowColor!,
                            item: "Products",
                            value: "100",
                            icon: Icons.add_box,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          StatCardItem(
                            color: AppColors.green,
                            item: "Revenue",
                            value: "\$100m",
                            icon: Icons.add_box,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: StatCardItem(
                                  color: AppColors.oranage,
                                  item: "Sales",
                                  value: "250K",
                                  icon: Icons.pie_chart_outline,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: StatCardItem(
                                  color: AppColors.blue!,
                                  item: "Customers",
                                  value: "250K",
                                  icon: Icons.emoji_emotions,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: StatCardItem(
                                  color: AppColors.yellowColor!,
                                  item: "Products",
                                  value: "100",
                                  icon: Icons.add_box,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: StatCardItem(
                                  color: AppColors.green,
                                  item: "Revenue",
                                  value: "\$100m",
                                  icon: Icons.add_box,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: UtilityClass.horizontalPadding,
            child: Responsive.isDesktop(context)
                ? Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Card(
                            elevation: 0,
                            color: AppColors.lightColor,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.all(25.0),
                                      height: 400,
                                      child: const DashboardChart()),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          elevation: 0,
                          color: AppColors.lightColor,
                          child: Container(
                              height: 400,
                              padding: const EdgeInsets.all(25.0),
                              child: const SalesChart()),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Card(
                          elevation: 0,
                          color: AppColors.lightColor,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(25.0),
                                    height: 400,
                                    child: const DashboardChart()),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      Card(
                        elevation: 0,
                        color: AppColors.lightColor,
                        child: Container(
                            height: 400,
                            width: Responsive.getSize(context).width,
                            padding: const EdgeInsets.all(25.0),
                            child: const SalesChart()),
                      ),
                    ],
                  ),
          ),
          const SizedBox(
            height: 30,
          ),
          const OrderTable(),
          const SizedBox(
            height: 30,
          ),
          Padding(
              padding: UtilityClass.horizontalPadding,
              child:
                  Responsive.isDesktop(context) || Responsive.isTablet(context)
                      ? const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Expanded(flex: 2, child: NotificationsWidget()),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(flex: 2, child: ActivityWidget())
                            ])
                      : const Column(
                          children: [
                            NotificationsWidget(),
                            SizedBox(
                              height: 20,
                            ),
                            ActivityWidget()
                          ],
                        ))
        ],
      ),
    );
  }
}
