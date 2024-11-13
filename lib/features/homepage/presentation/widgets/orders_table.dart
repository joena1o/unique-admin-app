import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/responsive.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

final List<String> columns = [
  'Customers',
  'Product',
  'User ID',
  'Order Place',
  'Amount',
  'Payment Status',
  'Order Status',
];

final List<Map<String, String>> data = [
  {
    'Customers': 'Soccer',
    'Product': '11',
    'User ID': 'Soccer',
    'Order Place': '11',
    'Amount': 'Soccer',
    'Payment Status': '11',
    'Order Status': 'Soccer'
  },
  {
    'Customers': 'Soccer',
    'Product': '11',
    'User ID': 'Soccer',
    'Order Place': '11',
    'Amount': 'Soccer',
    'Payment Status': '11',
    'Order Status': 'Soccer'
  },
  {
    'Customers': 'Soccer',
    'Product': '11',
    'User ID': 'Soccer',
    'Order Place': '11',
    'Amount': 'Soccer',
    'Payment Status': '11',
    'Order Status': 'Soccer'
  },
  {
    'Customers': 'Soccer',
    'Product': '11',
    'User ID': 'Soccer',
    'Order Place': '11',
    'Amount': 'Soccer',
    'Payment Status': '11',
    'Order Status': 'Soccer'
  },
  {
    'Customers': 'Soccer',
    'Product': '11',
    'User ID': 'Soccer',
    'Order Place': '11',
    'Amount': 'Soccer',
    'Payment Status': '11',
    'Order Status': 'Soccer'
  },
  // Add more rows here if needed
];

class OrderTable extends StatelessWidget {
  const OrderTable({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Orders",
                    style: FontClass.headerStyleBlack,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  !Responsive.isMobile(context)
                      ? Table(
                          border: const TableBorder.symmetric(
                            inside: BorderSide(width: 1.0),
                            outside: BorderSide.none,
                          ),
                          children: [
                            TableRow(
                              children: [
                                'Customers',
                                'Product',
                                'User ID',
                                'Order Place',
                                'Amount',
                                'Payment Status',
                                'Order Status',
                              ].map((header) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    header,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                            ),
                            ...data.map((row) {
                              return TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(row['Customers'] ?? '',
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(row['Product'] ?? '',
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(row['User ID'] ?? '',
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(row['Order Place'] ?? '',
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(row['Amount'] ?? '',
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(row['Payment Status'] ?? '',
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(row['Order Status'] ?? '',
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              );
                            }),
                          ],
                        )
                      : SingleChildScrollView(
                          scrollDirection:
                              Axis.horizontal, // For horizontal scroll
                          child: SingleChildScrollView(
                            scrollDirection:
                                Axis.vertical, // For vertical scroll
                            child: DataTable(
                              border: const TableBorder.symmetric(
                                inside: BorderSide(width: 1.0),
                                outside: BorderSide.none,
                              ),
                              columns: List.generate(columns.length, (index) {
                                return DataColumn(
                                    label: Text(
                                  columns[index],
                                  //textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ));
                              }),
                              rows: List.generate(
                                data.length, // Number of rows
                                (index) => DataRow(
                                    cells: List.generate(columns.length,
                                        (columnIndex) {
                                  return DataCell(Text(
                                    data[index][columns[columnIndex]]
                                        .toString(),
                                    textAlign: TextAlign.center,
                                  ));
                                })),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            )));
  }
}
