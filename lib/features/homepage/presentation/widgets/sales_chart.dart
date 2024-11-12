import 'package:flutter/material.dart';
import 'package:unique_admin_application/utils/font_class.dart';

class SalesChart extends StatefulWidget {
  const SalesChart({super.key});

  @override
  State<SalesChart> createState() => _SalesChartState();
}

class _SalesChartState extends State<SalesChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sales",
          style: FontClass.headerStyleBlack,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
