/**
 *  widget para visualizar graficas con la libreria flutter_charts
 */

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataChart extends StatelessWidget {
  final List<ChartData> chartData;
  final String title;
  final Color barColor;

  DataChart({
    required this.chartData,
    required this.title,
    required this.barColor,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(
        text: title,
        textStyle: TextStyle(color: Colors.white),
      ),
      primaryXAxis: CategoryAxis(
        labelStyle: TextStyle(color: Colors.white),
      ),
      primaryYAxis: NumericAxis(
        labelStyle: TextStyle(color: Colors.white),
      ),
      series: <ChartSeries<ChartData, String>>[
        BarSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.category,
          yValueMapper: (ChartData data, _) => data.amount,
          color: barColor,
          name: 'Data',
        )
      ],
      backgroundColor: Colors.black,
    );
  }
}

class ChartData {
  ChartData(this.category, this.amount);
  final String category;
  final double amount;
}
