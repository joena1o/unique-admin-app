import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/core/app_routes.dart';
import 'package:unique_admin_application/features/add_product/presentation/widgets/product_grid_view.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: UtilityClass.horizontalPadding,
            decoration: UtilityClass.setButtonDecoration(AppColors.green),
            child: ElevatedButton(
                onPressed: () {
                  context.push(AppRoutes.addProduct);
                },
                child: const Text("Add Product")),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            margin: UtilityClass.horizontalPadding,
            child: Card(
                elevation: 0,
                color: AppColors.lightColor,
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Products",
                            style: FontClass.headerStyleBlack,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const ProductGridView()
                        ]))))
      ]),
    );
  }
}
