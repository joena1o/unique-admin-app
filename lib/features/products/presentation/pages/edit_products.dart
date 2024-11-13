import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/responsive.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final List<String> items = ['One', 'Two', 'Three', 'Four'];
  String? selectedValue; // This will store the selected item

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
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
                            "Product Information",
                            style: FontClass.headerStyleBlack,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: UtilityClass.horizontalAndVerticalPadding,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.borderGray),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),

                                ///Mobile View
                                Responsive.isMobile(context)
                                    ? Column(
                                        children: [
                                          TextFormField(
                                            decoration: const InputDecoration(
                                                labelText:
                                                    "Enter Product Name"),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          DropdownButtonFormField<String>(
                                            value: selectedValue,
                                            hint: const Text(
                                                'Select Product Category'),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            icon: const Icon(
                                                Icons.arrow_drop_down),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedValue = newValue;
                                              });
                                            },
                                            items: items
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            decoration: const InputDecoration(
                                                labelText:
                                                    "Enter Product Price"),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            decoration: const InputDecoration(
                                                suffixIcon: Icon(Icons.percent),
                                                labelText:
                                                    "Set Product Discount"),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                      labelText:
                                                          "Enter Product Name"),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: DropdownButtonFormField<
                                                    String>(
                                                  value: selectedValue,
                                                  hint: const Text(
                                                      'Select Product Category'),
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  icon: const Icon(
                                                      Icons.arrow_drop_down),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      selectedValue = newValue;
                                                    });
                                                  },
                                                  items: items.map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
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
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                      labelText:
                                                          "Enter Product Price"),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                      suffixIcon:
                                                          Icon(Icons.percent),
                                                      labelText:
                                                          "Set Product Discount"),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),

                                ///Mobile View

                                const SizedBox(
                                  height: 20,
                                ),

                                TextFormField(
                                  maxLines: 5,
                                  decoration: const InputDecoration(
                                      labelText: "Enter Product Description"),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: Responsive.getSize(context).width,
                            height: 400,
                            padding: UtilityClass.horizontalAndVerticalPadding,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.borderGray),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Products Images",
                                    style: FontClass.headerStyleMediumBlack,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding:
                                      UtilityClass.horizontalAndVerticalPadding,
                                  child: Text(
                                    "Drop files here or click to upload",
                                    textAlign: TextAlign.center,
                                    style: FontClass.buttonStyleBlack,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: UtilityClass.verticalPadding,
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: UtilityClass.setButtonDecoration(
                                      Colors.grey[400]!),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Cancel")),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: UtilityClass.setButtonDecoration(
                                      AppColors.oranage),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Edit Product")),
                                )
                              ],
                            ),
                          )
                        ]))),
          ),
        ],
      ),
    );
  }
}
