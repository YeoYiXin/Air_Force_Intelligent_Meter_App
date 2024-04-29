import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intelligent_meter_app/src/pages/user/homepage/analytics/dummy_data.dart';

class HorizontalBarChart extends StatelessWidget {
  final List<WaterMeterStock> data = [
    WaterMeterStock(month: 'Oct', waterUsage: 35),
    WaterMeterStock(month: 'Nov', waterUsage: 120),
    WaterMeterStock(month: 'Dec', waterUsage: 55),
    WaterMeterStock(month: 'Jan', waterUsage: 70),
    WaterMeterStock(month: 'Feb', waterUsage: 25),
    WaterMeterStock(month: 'March', waterUsage: 90),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 200,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.9),
          border: Border.all(
            color: Color.fromRGBO(217, 217, 217, 1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 150,
                    titlesData: FlTitlesData(
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta titleMeta) {
                            int index = value.toInt();
                            if (index >= 0 && index < data.length) {
                              return bottomTitleWidget(
                                  data[index].month, titleMeta);
                            }
                            return Container(); // Return an empty Container widget if index is out of range
                          },
                          reservedSize: 50,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(
                      show: false,
                    ),
                    barGroups: data
                        .map(
                          (item) => BarChartGroupData(
                            x: data
                                .indexOf(item), // Use the index as the x-value
                            barsSpace: 4,
                            barRods: [
                              BarChartRodData(
                                toY: item.waterUsage
                                    .toDouble(), // Use meterCount as the y-value
                                width: 20,
                                color: Color.fromRGBO(203, 238, 155, 1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
        ),
      ),
    );
  }

  Widget bottomTitleWidget(String value, TitleMeta titleMeta) {
    return Center(
      child: Text(
        value,
        style: const TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }
}
