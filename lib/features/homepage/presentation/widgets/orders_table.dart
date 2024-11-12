import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

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
    return Padding(
        padding: UtilityClass.horizontalPadding,
        child: Row(children: [
          Expanded(
              flex: 2,
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
                        Table(
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
                        ),
                      ],
                    ),
                  )))
        ]));
  }
}
