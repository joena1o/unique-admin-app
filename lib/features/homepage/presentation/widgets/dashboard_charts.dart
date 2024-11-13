import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/legend_widget.dart';
import 'package:unique_admin_application/utils/responsive.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardChart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  const DashboardChart({super.key});

  @override
  DashboardChartState createState() => DashboardChartState();
}

class DashboardChartState extends State<DashboardChart> {
  dynamic dataPoints = const [
    FlSpot(0, 10),
    FlSpot(1, 8),
    FlSpot(2, 14),
    FlSpot(3, 10),
    FlSpot(4, 15),
    FlSpot(5, 13),
    FlSpot(6, 10),
  ];

  dynamic dataPoints2 = const [
    FlSpot(0, 8),
    FlSpot(1, 5),
    FlSpot(2, 2),
    FlSpot(3, 6),
    FlSpot(4, 5),
    FlSpot(5, 7),
    FlSpot(6, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: Responsive.getSize(context).width,
            child: AspectRatio(
              aspectRatio: 1.5,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: dataPoints,
                      isCurved: true,
                      barWidth: 3,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Colors.blueAccent.withOpacity(0.3),
                            Colors.blueAccent.withOpacity(0.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      dotData: const FlDotData(show: false),
                    ),
                    LineChartBarData(
                      spots: dataPoints2,
                      isCurved: true,
                      barWidth: 3,
                      aboveBarData: BarAreaData(
                        color: Colors.redAccent.withOpacity(0.3),
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Colors.red.withOpacity(0.3),
                            Colors.red.withOpacity(0.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      dotData: const FlDotData(show: false),
                    ),
                  ],
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
                          return Text(
                            days[value.toInt()],
                            style: const TextStyle(
                                fontSize: 10, color: Colors.black),
                          );
                        },
                        reservedSize: 32,
                        interval: 1,
                      ),
                    ),
                  ),
                  gridData:
                      const FlGridData(show: true, drawHorizontalLine: false),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 20,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LegendItem(color: Colors.blueAccent, text: "Sales"),
            SizedBox(width: 16),
            LegendItem(color: Colors.redAccent, text: "Revenue"),
          ],
        ),
      ],
    );
  }
}
