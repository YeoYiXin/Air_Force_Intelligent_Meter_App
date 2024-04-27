import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/dummy_data.dart';

class HorizontalBarChart extends StatelessWidget {
  final List<WaterMeterStock> data = [
    WaterMeterStock(meterAmount: '15 MM (P)', meterCount: 20),
    WaterMeterStock(meterAmount: '15 MM (B)', meterCount: 35),
    WaterMeterStock(meterAmount: '20 MM', meterCount: 40),
    WaterMeterStock(meterAmount: '25 MM', meterCount: 55),
    WaterMeterStock(meterAmount: '40 MM', meterCount: 70),
    WaterMeterStock(meterAmount: '50 MM', meterCount: 80),
    WaterMeterStock(meterAmount: '80 MM', meterCount: 90),
    WaterMeterStock(meterAmount: '100 MM', meterCount: 100),
    WaterMeterStock(meterAmount: '150 MM', meterCount: 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 380,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(217, 217, 217, 1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 40, right: 40),
          child: RotatedBox(
            quarterTurns: 1,
            child: Center(
              child: AspectRatio(
                aspectRatio: 1.2,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 100,
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
                                  data[index].meterAmount, titleMeta);
                            }
                            return Container(); // Return an empty Container widget if index is out of range
                          },
                          reservedSize: 70,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(
                      show: false,
                    ),
                    extraLinesData: ExtraLinesData(
                      horizontalLines: [
                        HorizontalLine(
                          y: 50,
                          color: Colors.black87,
                          strokeWidth: 1.5,
                          dashArray: [5, 5],
                        ),
                      ],
                    ),
                    barGroups: data
                        .map(
                          (item) => BarChartGroupData(
                            x: data
                                .indexOf(item), // Use the index as the x-value
                            barsSpace: 4,
                            barRods: [
                              BarChartRodData(
                                toY: item.meterCount
                                    .toDouble(), // Use meterCount as the y-value
                                width: 25,
                                color: item.meterCount < 50
                                    ? Color.fromRGBO(255,137,125,1)
                                    : Color.fromRGBO(77,189,229,1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
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
      ),
    );
  }

  Widget bottomTitleWidget(String value, TitleMeta titleMeta) {
    return RotatedBox(
      quarterTurns: 3, // Rotates the text by 270 degrees (90 * 3)
      child: Text(
        value,
        style: const TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }
}
