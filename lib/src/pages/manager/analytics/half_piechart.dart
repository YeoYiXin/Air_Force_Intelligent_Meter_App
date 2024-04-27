import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/dummy_data_complain.dart';

class HalfPieChart extends StatelessWidget {
    late final TooltipBehavior _tooltipBehavior;

  HalfPieChart() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      tooltipPosition: TooltipPosition.pointer,
    );
  }

  final List<MeterComplain> meterComplain = [
    MeterComplain(
      id: 1,
      complainClass: 'Faulty Program',
      number: 9287,
      color: Color.fromRGBO(44,99,139,1),
    ),
    MeterComplain(
      id: 2,
      complainClass: 'Meter Complain',
      number: 2387,
      color: Color.fromRGBO(77,189,229,1),
    ),
    MeterComplain(
      id: 3,
      complainClass: 'Meter Leak Complain',
      number: 3287,
      color: Color.fromRGBO(141,198,65,1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // Aspect ratio for the pie chart
      child: SfCircularChart(
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
        DoughnutSeries<MeterComplain, String>(
          dataSource: meterComplain,
          pointColorMapper: (MeterComplain data, _) => data.color,
          xValueMapper: (MeterComplain data, _) => data.complainClass,
          yValueMapper: (MeterComplain data, _) => data.number,
          // Starting angle of doughnut
          startAngle: 270,
          // Ending angle of doughnut
          endAngle: 90,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
          ),
          explode: true,
          explodeAll: true,
          // Callback to handle tap on data point
          selectionBehavior: SelectionBehavior(enable: true),
          enableTooltip: true,
        ),
      ]),
    );
  }


 
}
