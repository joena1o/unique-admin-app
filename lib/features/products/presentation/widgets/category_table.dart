import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/features/products/presentation/provider/product_provider.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/responsive.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

class CategoryTable extends StatelessWidget {
  CategoryTable({super.key});

  final List<String> columns = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Responsive.getSize(context).width,
        padding: UtilityClass.horizontalPadding,
        child: Card(
            elevation: 0,
            color: AppColors.lightColor,
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Consumer<ProductProvider>(
                  builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Category",
                      style: FontClass.headerStyleBlack,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // !Responsive.isMobile(context)
                    //     ? Table(
                    //         defaultVerticalAlignment:
                    //             TableCellVerticalAlignment.middle,
                    //         border: const TableBorder.symmetric(
                    //           inside: BorderSide(width: 1.0),
                    //           outside: BorderSide.none,
                    //         ),
                    //         children: [
                    //           TableRow(
                    //             children: columns.map((header) {
                    //               return Padding(
                    //                 padding: const EdgeInsets.all(10.0),
                    //                 child: Text(
                    //                   header,
                    //                   textAlign: TextAlign.center,
                    //                   style: const TextStyle(
                    //                       fontWeight: FontWeight.bold),
                    //                 ),
                    //               );
                    //             }).toList(),
                    //           ),
                    //           ...provider.categories!.map((row) {
                    //             return TableRow(
                    //                 children:
                    //                     List.generate(columns.length, (index) {
                    //               return Padding(
                    //                 padding: const EdgeInsets.all(10.0),
                    //                 child:
                    //                     Text(row, textAlign: TextAlign.center),
                    //               );
                    //             }));
                    //           }),
                    //         ],
                    //       )
                    //     : SingleChildScrollView(
                    //         scrollDirection:
                    //             Axis.horizontal, // For horizontal scroll
                    //         child: SingleChildScrollView(
                    //           scrollDirection:
                    //               Axis.vertical, // For vertical scroll
                    //           child: DataTable(
                    //             border: const TableBorder.symmetric(
                    //               inside: BorderSide(width: 1.0),
                    //               outside: BorderSide.none,
                    //             ),
                    //             columns: List.generate(columns.length, (index) {
                    //               return DataColumn(
                    //                   label: Text(
                    //                 columns[index],
                    //                 //textAlign: TextAlign.center,
                    //                 style: const TextStyle(
                    //                     fontWeight: FontWeight.bold),
                    //               ));
                    //             }),
                    //             rows: List.generate(
                    //               provider.categories!.length, // Number of rows
                    //               (index) => DataRow(
                    //                   cells: List.generate(columns.length,
                    //                       (columnIndex) {
                    //                 return DataCell(Text(
                    //                   provider.categories![index].toString(),
                    //                   textAlign: TextAlign.center,
                    //                 ));
                    //               })),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                  ],
                );
              }),
            )));
  }
}
