import 'package:flutter/material.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/dummy_data_forecast.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/forecasting/prediction.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartForecast extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;

  LineChartForecast({Key? key, required this.startDate, required this.endDate})
      : super(key: key);

  @override
  _LineChartForecastState createState() => _LineChartForecastState();
}

class _LineChartForecastState extends State<LineChartForecast> {
  late final TooltipBehavior _tooltipBehavior;
  late double minYValue = 0;
  Map<String, double> forecastData = {};

  @override
  void initState() {
    super.initState();
    // Fetch forecast data when the widget is initialized
    getForecastData(widget.startDate, widget.endDate);
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      tooltipPosition: TooltipPosition.pointer,
      builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
          int seriesIndex) {
        if (point != null) {
          final DateTime xValue = point.x as DateTime;
          final monthName = getMonthName(xValue);
          return Container( 
            width: 80,
            height: 60,
            child:Center( child:Text('$monthName' + '\n' + point.y.toString(), style: TextStyle(color: Colors.white))));
        }
        return Container(); // Replace 'return null;' with a valid widget
      },
    );
  }

  @override
  void didUpdateWidget(LineChartForecast oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update the minimum y-axis value when the widget receives new data
    if (oldWidget.startDate != widget.startDate ||
        oldWidget.endDate != widget.endDate) {
      getForecastData(widget.startDate, widget.endDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // Aspect ratio for the pie chart
      child: SfCartesianChart(
        tooltipBehavior: _tooltipBehavior,
        primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat('yyyy-MM'), // Custom date format
        ),
        primaryYAxis: NumericAxis(
          minimum: minYValue - 1000, // Adjust the minimum value
        ),
        series: <CartesianSeries>[
          LineSeries<ForecastResult, DateTime>(
            dataSource: forecastData.entries
                .map((entry) => ForecastResult(
                      monthVal: entry.key,
                      value: entry.value,
                    ))
                .toList(),
            xValueMapper: (ForecastResult data, _) =>
                DateTime.parse(data.monthVal),
            yValueMapper: (ForecastResult data, _) => data.value,
            selectionBehavior: SelectionBehavior(enable: true),
            markerSettings: MarkerSettings(isVisible: true),
            enableTooltip: true,
          )
        ],
      ),
    );
  }

  Future<void> getForecastData(DateTime startDate, DateTime endDate) async {
    // Fetch data from the server
    try {
      // return data
      ProphetAlgorithm forecasting = ProphetAlgorithm(
        startDate: startDate,
        endDate: endDate,
        baseURL: 'http://172.18.5.53:5000',
      );

      forecastData = await forecasting.forecastVal();
      print("ForecastData in linechart: $forecastData");
      // Update the minimum y-axis value
      minYValue =
          forecastData.values.reduce((min, value) => value < min ? value : min);
      setState(() {}); // Trigger a rebuild with the new forecast data
    } catch (e) {
      // Handle error
      throw e;
    }
  }

  String getMonthName(dynamic xValue) {
  // Convert the x-value to a DateTime object
  final DateTime dateTime =
      xValue is DateTime ? xValue : DateTime.parse(xValue);
  // Get the month from the DateTime object
  final month = dateTime.month;
  // Get the month name based on the month number
  final monthNames = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  // Get the year from the DateTime object
  final year = dateTime.year;
  // Concatenate the month name and year
  return '${monthNames[month - 1]} $year';
}

}
