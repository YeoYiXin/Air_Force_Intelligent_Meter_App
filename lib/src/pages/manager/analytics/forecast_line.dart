import 'package:flutter/material.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/line_chart.dart';
import 'package:intl/intl.dart';

class MeterForecastPlot extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  const MeterForecastPlot({required this.startDate, required this.endDate});

  @override
  State<MeterForecastPlot> createState() => _MeterForecastPlotState();
}

class _MeterForecastPlotState extends State<MeterForecastPlot> {
  late DateTime _nextMonthStartDate = DateTime(
      widget.startDate.year, widget.startDate.month + 1, widget.startDate.day);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(217, 217, 217, 1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.all(10),
                  
                  child: Text(
                    "Prediction for inventory needed for: ${DateFormat('MMM yyyy').format(_nextMonthStartDate)} to ${DateFormat('MMM yyyy').format(widget.endDate)}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              LineChartForecast(
                  startDate: widget.startDate, endDate: widget.endDate)
            ])));
  }
}
