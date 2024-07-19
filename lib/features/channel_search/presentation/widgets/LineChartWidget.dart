import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../domain/models/ChartData.dart';

class LineChartWidget extends StatelessWidget {
 final List<ChartData> chartData;

  LineChartWidget(this.chartData, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7,
      child: SfCartesianChart(
        legend: Legend(
          title: LegendTitle(
            text: 'Акции'
          ),
            isVisible: true
        ),
        primaryXAxis: DateTimeAxis(),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          LineSeries<ChartData, DateTime>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.date,
            yValueMapper: (ChartData data, _) => data.close,
            color: Colors.deepOrange,
            isVisibleInLegend: true,
            name: chartData[0].label
          ),
        ],
      )
    );
  }
}
