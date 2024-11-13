import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/responsive.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

final List<String> columns = [
  'Customer Name',
  'Review ID',
  'Rating',
  'Comment',
  'Product Name',
  'Date',
];

final List<Map<String, dynamic>> data = [
  {
    'Customer Name': 'Hyefur Jonathan',
    'Review ID': '101',
    'Rating': 5,
    'Comment': 'Amazing quality! The fabric is soft and comfortable.',
    'Product Name': 'Cotton T-Shirt',
    'Date': '2024-10-11',
  },
  {
    'Customer Name': 'Musa Aliyu',
    'Review ID': '102',
    'Rating': 4,
    'Comment': 'Good fit, but the color was a bit different from the picture.',
    'Product Name': 'Denim Jeans',
    'Date': '2024-10-15',
  },
  {
    'Customer Name': 'Fatima Usman',
    'Review ID': '103',
    'Rating': 3,
    'Comment': 'Average fit, could be more breathable.',
    'Product Name': 'Summer Dress',
    'Date': '2024-10-20',
  },
  {
    'Customer Name': 'Amina Bello',
    'Review ID': '104',
    'Rating': 5,
    'Comment': 'Absolutely love this jacket, fits perfectly and looks great!',
    'Product Name': 'Leather Jacket',
    'Date': '2024-10-22',
  },
  {
    'Customer Name': 'John Okeke',
    'Review ID': '105',
    'Rating': 2,
    'Comment': 'Not impressed with the material quality.',
    'Product Name': 'Wool Sweater',
    'Date': '2024-10-25',
  },
  {
    'Customer Name': 'Joy Ibrahim',
    'Review ID': '106',
    'Rating': 4,
    'Comment': 'Nice fit and style, just wish it came in more colors.',
    'Product Name': 'Button-up Shirt',
    'Date': '2024-10-27',
  },
  {
    'Customer Name': 'David Emeka',
    'Review ID': '107',
    'Rating': 5,
    'Comment': 'Love the fabric and the fit! Perfect for casual wear.',
    'Product Name': 'Chinos Pants',
    'Date': '2024-11-01',
  },
  {
    'Customer Name': 'Grace Oluwaseun',
    'Review ID': '108',
    'Rating': 3,
    'Comment':
        'The material was too thick for summer, but it’s good for winter.',
    'Product Name': 'Winter Coat',
    'Date': '2024-11-03',
  },
  {
    'Customer Name': 'Ahmed Garba',
    'Review ID': '109',
    'Rating': 4,
    'Comment': 'Comfortable and stylish, but the sleeves are a bit short.',
    'Product Name': 'Hoodie Sweatshirt',
    'Date': '2024-11-05',
  },
  {
    'Customer Name': 'Binta Adamu',
    'Review ID': '110',
    'Rating': 5,
    'Comment': 'Great fit and perfect length. Would definitely recommend.',
    'Product Name': 'Pencil Skirt',
    'Date': '2024-11-07',
  },
];

class ReviewTable extends StatelessWidget {
  const ReviewTable({super.key});

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
                    "Reviews",
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
