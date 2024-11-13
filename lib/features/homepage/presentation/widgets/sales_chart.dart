import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/responsive.dart';

class SalesChart extends StatefulWidget {
  const SalesChart({super.key});

  @override
  State<SalesChart> createState() => _SalesChartState();
}

class _SalesChartState extends State<SalesChart> {
  List<double> dataValues = [12, 8, 15, 10, 14, 7, 5];
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
        Expanded(
          child: SizedBox(
            width: Responsive.getSize(context).width * .9,
            child: AspectRatio(
              aspectRatio: 1.5,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY:
                      20, // Set a reasonable maximum Y value based on your data
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false, interval: 5),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false, interval: 5),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false, interval: 5),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const days = [
                            'Mon',
                            'Tue',
                            'Wed',
                            'Thu',
                            'Fri',
                            'Sat',
                            'Sun'
                          ];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              days[value.toInt()],
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black),
                            ),
                          );
                        },
                        reservedSize: 32,
                      ),
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(
                    show: false,
                    border: Border.all(color: Colors.grey, width: 10),
                  ),
                  barGroups: dataValues.asMap().entries.map((entry) {
                    return BarChartGroupData(
                      x: entry.key,
                      barRods: [
                        BarChartRodData(
                          toY: entry.value,
                          color: Colors.blueAccent,
                          width: 23,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("2100", style: FontClass.headerStyleMediumBlack),
              const Text("12% higher than last month")
            ],
          ),
        )
      ],
    );
  }
}
