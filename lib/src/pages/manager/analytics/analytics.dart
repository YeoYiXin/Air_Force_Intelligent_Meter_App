import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/dottedLine.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/dummy_data.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/forecast_line.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/horizontal_bar_chart.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/semicircle_gauge.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  bool isPressed = false;
  late OverlayEntry _overlayEntry;
  late OverlayState _overlay;
  int duration = 180;

  @override
  void initState() {
    super.initState();
    _overlay = Overlay.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: MediaQuery.of(context).padding,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // prediction of meter forecast
              Gap(10),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Gap(10),
                      Text(
                        "Meter Forecast Prediction",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(163, 176, 182, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),

              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Gap(10),
                      Text(
                        "Filter by: Month",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(163, 176, 182, 1),
                        ),
                      ),
                      Gap(10),
                      IconButton(
                        icon: Image.asset("assets/icons/Funnel.png"),
                        onPressed: () {
                          setState(() {
                            isPressed = !isPressed;
                            if (isPressed) {
                              _overlayEntry = _createOverlayEntry();
                              _overlay.insert(_overlayEntry);
                            } else {
                              _overlayEntry.remove();
                            }
                          });
                        },
                      ),
                    ],
                  )),

              // pick date - default show the 6 months - show data from next months to 6 months
              MeterForecastPlot(
                startDate: DateTime.now(),
                endDate: DateTime.now().add(Duration(days: duration)),
              ),

              // first line
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Inventory Level Overview",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(163, 176, 182, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Image.asset("assets/icons/Todo.png"),
                      onPressed: () {
                        // Action on button press
                      },
                    ),
                    Text(
                      "Place Order",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(14, 102, 129, 1),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromRGBO(14, 102, 129, 1),
                      ),
                    ),
                  ],
                ),
              ),

              // Horizontal bar plot
              HorizontalBarChart(),

              Gap(10),

              // box to show the meaning
              Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(77, 189, 229, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor:
                                      Color.fromRGBO(77, 189, 229, 1),
                                ),
                              ),
                              Gap(30),
                              Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  "Current Stock",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: const CircleAvatar(
                                  radius: 5,
                                  backgroundColor:
                                      Color.fromRGBO(255, 137, 125, 1),
                                ),
                              ),
                              Gap(30),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: const Text(
                                  "Very Low Stock",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(10),

                          // dotted line showing Minimum buffer stock
                          Row(
                            children: [
                              Gap(10),
                              SizedBox(
                                width: 30, // Adjust the width as needed
                                child: CustomPaint(
                                  size: Size(
                                      30, 1), // Width and height of the line
                                  painter: DottedLinePainter(
                                      color: Colors
                                          .black87!), // Custom painter for the dotted line
                                ),
                              ),
                              SizedBox(
                                  width:
                                      20), // Adjust the spacing between the line and the text
                              Text(
                                "Minimum buffer stock",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Gap(10),
                        ],
                      ))),
              Gap(10),
              SemiCirclePlot(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderObject? renderBox = context.findRenderObject();
    // var size = renderBox?.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: 200,
        child: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 100),
          child: Material(
            elevation: 4.0,
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  "Select Range",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                     setState(() {
                      duration = 90;
                    });
                  },
                  child: Text("Three Months"),
                ),
                ElevatedButton(
                  onPressed: () {
                     setState(() {
                      duration = 180;
                    });
                  },
                  child: Text("Six Months"),
                ),
                ElevatedButton(
                  onPressed: () {
                     setState(() {
                      duration = 365;
                    });
                  },
                  child: Text("Twelve Months"),
                ),
                ElevatedButton(
                  onPressed: () {
                     setState(() {
                      duration = 450;
                    });
                  },
                  child: Text("Fifteen Months"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
