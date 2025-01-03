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

final List<Map<String, dynamic>> data = [
  {
    'Customers': 'John Doe',
    'Product': 'Wireless Mouse',
    'User ID': 'U001',
    'Order Place': '2024-11-10 14:32',
    'Amount': 29.99,
    'Payment Status': 'Paid',
    'Order Status': 'Shipped',
  },
  {
    'Customers': 'Jane Smith',
    'Product': 'Bluetooth Headphones',
    'User ID': 'U002',
    'Order Place': '2024-11-10 15:00',
    'Amount': 89.99,
    'Payment Status': 'Paid',
    'Order Status': 'Delivered',
  },
  {
    'Customers': 'Michael Johnson',
    'Product': 'Smart Watch',
    'User ID': 'U003',
    'Order Place': '2024-11-11 10:10',
    'Amount': 199.99,
    'Payment Status': 'Pending',
    'Order Status': 'Processing',
  },
  {
    'Customers': 'Emma Davis',
    'Product': 'Gaming Keyboard',
    'User ID': 'U004',
    'Order Place': '2024-11-11 12:45',
    'Amount': 59.99,
    'Payment Status': 'Paid',
    'Order Status': 'Shipped',
  },
  {
    'Customers': 'Liam Brown',
    'Product': 'Laptop Stand',
    'User ID': 'U005',
    'Order Place': '2024-11-12 09:30',
    'Amount': 25.99,
    'Payment Status': 'Paid',
    'Order Status': 'Delivered',
  },
  {
    'Customers': 'Olivia Wilson',
    'Product': 'Wireless Keyboard',
    'User ID': 'U006',
    'Order Place': '2024-11-12 14:00',
    'Amount': 39.99,
    'Payment Status': 'Pending',
    'Order Status': 'Processing',
  },
  {
    'Customers': 'James Moore',
    'Product': 'Portable Speaker',
    'User ID': 'U007',
    'Order Place': '2024-11-13 08:45',
    'Amount': 69.99,
    'Payment Status': 'Paid',
    'Order Status': 'Delivered',
  },
  {
    'Customers': 'Isabella Taylor',
    'Product': 'Phone Case',
    'User ID': 'U008',
    'Order Place': '2024-11-13 13:00',
    'Amount': 15.99,
    'Payment Status': 'Paid',
    'Order Status': 'Shipped',
  },
  {
    'Customers': 'William Anderson',
    'Product': 'LED Desk Lamp',
    'User ID': 'U009',
    'Order Place': '2024-11-14 16:20',
    'Amount': 39.99,
    'Payment Status': 'Pending',
    'Order Status': 'Processing',
  },
  {
    'Customers': 'Sophia Martinez',
    'Product': 'Noise Cancelling Headphones',
    'User ID': 'U010',
    'Order Place': '2024-11-14 18:00',
    'Amount': 129.99,
    'Payment Status': 'Paid',
    'Order Status': 'Delivered',
  },
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
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: const TableBorder.symmetric(
                            inside: BorderSide(width: 1.0),
                            outside: BorderSide.none,
                          ),
                          children: [
                            TableRow(
                              children: columns.map((header) {
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
                                  children:
                                      List.generate(columns.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(row[columns[index]].toString(),
                                      textAlign: TextAlign.center),
                                );
                              }));
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
