import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/features/products/presentation/provider/product_provider.dart';
import 'package:unique_admin_application/features/products/presentation/widgets/category_table.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    context.read<ProductProvider>().fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                    showAddCategoryModal();
                  },
                  child: const Text("Add Category")),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CategoryTable()
        ],
      ),
    );
  }

  void showAddCategoryModal() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              padding: UtilityClass.horizontalAndVerticalPadding,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: categoryController,
                    validator: (String? text) {
                      if (text!.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(labelText: "Enter Category Name"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<ProductProvider>(
                      builder: (context, provider, child) {
                    return !provider.uploadingProduct
                        ? Container(
                            width: double.infinity,
                            margin: UtilityClass.verticalPadding,
                            decoration: UtilityClass.setButtonDecoration(
                                AppColors.green),
                            child: ElevatedButton(
                                onPressed: () {
                                  provider.addCategory(categoryController.text,
                                      () => categoryController.text = "");
                                },
                                child: const Text("Add Category")),
                          )
                        : Container(
                            padding: UtilityClass.verticalPadding,
                            child: const CircularProgressIndicator());
                  }),
                ],
              ),
            );
          });
        });
  }
}
