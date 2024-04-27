import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/dottedLine.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/half_piechart.dart';

class SemiCirclePlot extends StatelessWidget {
  const SemiCirclePlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(bottom: 10),
        height: 460,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(217, 217, 217, 1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "Total Meter Forecast",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(146, 145, 165, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "28, 538",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
                // Date range
                Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(204, 229, 255, 1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              "March 2024",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.keyboard_arrow_down_outlined),
                              onPressed: () {}),
                        ])),
                Gap(10),
              ],
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                color: Color.fromRGBO(217, 217, 217, 1),
                thickness: 1,
              ),
            ),

            // semi circle
            Gap(10),

            Stack(
              children: [
                Flexible(
                  child: HalfPieChart(),
                ),
                Gap(10),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.35 - 80,
                  right: 20,
                  left: 20,
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
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor:
                                      Color.fromRGBO(255, 137, 125, 1),
                                ),
                              ),
                              Gap(30),
                              Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
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
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
