import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:provider/provider.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/features/products/presentation/provider/product_provider.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/responsive.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productDiscount = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<String> items = ['One', 'Two', 'Three', 'Four'];
  String? selectedValue; // This will store the selected item

  //final List<html.File> _localImages = [];
  List<Image>? fromPicker;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
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
                              padding:
                                  UtilityClass.horizontalAndVerticalPadding,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderGray),
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
                                              controller: productName,
                                              validator: (String? text) {
                                                if (text!.isEmpty) {
                                                  return "Field cannot be empty";
                                                }
                                                return null;
                                              },
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
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please select a category';
                                                }
                                                return null;
                                              },
                                              items: items.map<
                                                      DropdownMenuItem<String>>(
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
                                              controller: productPrice,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (String? text) {
                                                if (text!.isEmpty) {
                                                  return "Field cannot be empty";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                  labelText:
                                                      "Enter Product Price"),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              controller: productDiscount,
                                              validator: (String? text) {
                                                if (text!.isEmpty) {
                                                  return "Field cannot be empty";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                  suffixIcon:
                                                      Icon(Icons.percent),
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
                                                    controller: productName,
                                                    validator: (String? text) {
                                                      if (text!.isEmpty) {
                                                        return "Field cannot be empty";
                                                      }
                                                      return null;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            labelText:
                                                                "Enter Product Name"),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child:
                                                      DropdownButtonFormField<
                                                          String>(
                                                    value: selectedValue,
                                                    hint: const Text(
                                                        'Select Product Category'),
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    icon: const Icon(
                                                        Icons.arrow_drop_down),
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        selectedValue =
                                                            newValue;
                                                      });
                                                    },
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please select a category';
                                                      }
                                                      return null;
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
                                                    controller: productPrice,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    validator: (String? text) {
                                                      if (text!.isEmpty) {
                                                        return "Field cannot be empty";
                                                      }
                                                      return null;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            labelText:
                                                                "Enter Product Price"),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: TextFormField(
                                                    controller: productDiscount,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    validator: (String? text) {
                                                      if (text!.isEmpty) {
                                                        return "Field cannot be empty";
                                                      }
                                                      return null;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            suffixIcon: Icon(
                                                                Icons.percent),
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
                                    controller: productDescription,
                                    validator: (String? text) {
                                      if (text!.isEmpty) {
                                        return "Field cannot be empty";
                                      }
                                      return null;
                                    },
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
                            GestureDetector(
                              onTap: () async {
                                //pickFiles();
                                fromPicker = await ImagePickerWeb
                                    .getMultiImagesAsWidget();
                                setState(() {});
                              },
                              child: Container(
                                width: Responsive.getSize(context).width,
                                height: 400,
                                padding:
                                    UtilityClass.horizontalAndVerticalPadding,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.borderGray),
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
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (fromPicker != null)
                                            Expanded(
                                              child: GridView.count(
                                                  crossAxisCount: 3,
                                                  children: List.generate(
                                                      fromPicker!.length,
                                                      (index) {
                                                    return Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20),
                                                      width: 150,
                                                      height: 150,
                                                      child: fromPicker![index],
                                                    );
                                                  })),
                                            ),
                                          if (fromPicker == null)
                                            Container(
                                              padding: UtilityClass
                                                  .horizontalAndVerticalPadding,
                                              child: Text(
                                                "Drop files here or click to upload",
                                                textAlign: TextAlign.center,
                                                style:
                                                    FontClass.buttonStyleBlack,
                                              ),
                                            ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Consumer<ProductProvider>(
                                builder: (context, provider, child) {
                              return !provider.uploadingProduct
                                  ? Container(
                                      width: double.infinity,
                                      margin: UtilityClass.verticalPadding,
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: UtilityClass
                                                .setButtonDecoration(
                                                    Colors.grey[400]!),
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: const Text("Cancel")),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            decoration: UtilityClass
                                                .setButtonDecoration(
                                                    AppColors.green),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    // ProductModel productModel =
                                                    //     ProductModel(
                                                    //         productName:
                                                    //             productName
                                                    //                 .text,
                                                    //         productDiscount:
                                                    //             productDiscount
                                                    //                 .text,
                                                    //         productPrice:
                                                    //             int.parse(
                                                    //                 productPrice
                                                    //                     .text),
                                                    //         productDescription:
                                                    //             productDescription
                                                    //                 .text,
                                                    //         productCategory:
                                                    //             selectedValue);
                                                    // provider.addProduct(
                                                    //     productModel,
                                                    //     _localImages,
                                                    //     () => context.go(
                                                    //         AppRoutes
                                                    //             .products));
                                                  }
                                                },
                                                child:
                                                    const Text("Add Product")),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(
                                      padding: UtilityClass.verticalPadding,
                                      child: const CircularProgressIndicator());
                            })
                          ]))),
            ),
          ],
        ),
      ),
    );
  }

//   Future<List<html.File>> pickFiles() async {
//     final completer = Completer<List<html.File>>();
//     final input = html.FileUploadInputElement()..multiple = true;

//     input.onChange.listen((event) {
//       final files = input.files;
//       if (files != null) {
//         completer.complete(files.toList());
//       } else {
//         completer.complete([]);
//       }
//     });

//     input.click(); // Simulate a file picker click
//     return completer.future;
//   }
}
