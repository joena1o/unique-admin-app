import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/responsive.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

class CustomersTable extends StatelessWidget {
  CustomersTable({super.key});

  final List<String> columns = [
    'First Name',
    'Last Name',
    'User ID',
    'Address',
    'Status',
  ];

  final List<Map<String, String>> data = [
    {
      'First Name': 'Hyefur',
      'Last Name': 'Jonathan',
      'User ID': '1',
      'Address': 'Kofare',
      'Status': 'active',
    },
    {
      'First Name': 'Musa',
      'Last Name': 'Aliyu',
      'User ID': '2',
      'Address': 'Yola',
      'Status': 'inactive',
    },
    {
      'First Name': 'Fatima',
      'Last Name': 'Usman',
      'User ID': '3',
      'Address': 'Jimeta',
      'Status': 'active',
    },
    {
      'First Name': 'Amina',
      'Last Name': 'Bello',
      'User ID': '4',
      'Address': 'Kofare',
      'Status': 'active',
    },
    {
      'First Name': 'John',
      'Last Name': 'Okeke',
      'User ID': '5',
      'Address': 'Numan',
      'Status': 'inactive',
    },
    {
      'First Name': 'Joy',
      'Last Name': 'Ibrahim',
      'User ID': '6',
      'Address': 'Mubi',
      'Status': 'active',
    },
    {
      'First Name': 'David',
      'Last Name': 'Emeka',
      'User ID': '7',
      'Address': 'Girei',
      'Status': 'active',
    },
    {
      'First Name': 'Grace',
      'Last Name': 'Oluwaseun',
      'User ID': '8',
      'Address': 'Yola',
      'Status': 'inactive',
    },
    {
      'First Name': 'Ahmed',
      'Last Name': 'Garba',
      'User ID': '9',
      'Address': 'Kofare',
      'Status': 'active',
    },
    {
      'First Name': 'Binta',
      'Last Name': 'Adamu',
      'User ID': '10',
      'Address': 'Jimeta',
      'Status': 'inactive',
    },
  ];

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
                    "Users",
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
                                  child: Text(row[columns[index]] ?? '',
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
