import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/jobs/camera/camera.dart';
import 'package:intelligent_meter_app/src/pages/staff/navigation/bottom_nav.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailState();
}

class _DetailState extends State<Details> {
  Camera camera = Camera();

  @override
  void initState() {
    super.initState();
    camera.onImageSelected = () {
      setState(() {});
    };
  }

  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Meter Replacement Program',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '01586564',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.12,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color.fromRGBO(228, 233, 236, 1),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(228, 233, 236, 1),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin: EdgeInsets.all(10),
                        child: Row(children: [
                          Image.asset(
                            "assets/icons/Home_white.png",
                            width: 20,
                            height: 20,
                          ),
                          Gap(10),
                          Text('Where?',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  decorationColor: Colors.white))
                        ]))),
                Gap(10),
                // direction
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "12, BU 12/2",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Gap(10),
                                Row(
                                  children: [
                                    Text(
                                      "47800 Bandar Utama",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ],
                                )
                              ]),
                          Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(
                                        14, 102, 129, 1), // Border color
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "Open directions in Map",
                                  style: TextStyle(
                                    color: Color.fromRGBO(14, 102, 129, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ]),
                  ),
                ),
                Gap(15),
                Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text("Progress last updated yesterday 12:08pm",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )))),
                Gap(10),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.5,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Expanded(
                      child: ListView(children: [
                        // first
                        TimelineTile(
                          alignment: TimelineAlign.start,
                          lineXY: 0.3,
                          isFirst: true,
                          indicatorStyle: IndicatorStyle(
                            width: 40,
                            color: Color.fromRGBO(44, 99, 139, 1),
                            indicatorXY: 0.2,
                            iconStyle: IconStyle(
                              iconData: Icons.check,
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          afterLineStyle: const LineStyle(
                            color: Color.fromRGBO(44, 99, 139, 1),
                            thickness: 2.5,
                          ),
                          endChild: Container(
                            constraints: const BoxConstraints(
                              minHeight: 75,
                            ),
                            padding: const EdgeInsets.only(
                                top: 5,
                                left: 25), // Add padding for aesthetic spacing
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  // Expanded widget allows the text to fill available space,
                                  // pushing the icon to the right.
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Meter Inspection',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromRGBO(
                                                  44, 99, 139, 1),
                                              fontWeight: FontWeight.bold)),
                                      Text('Meter is faulty',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  44, 99, 139, 1))),
                                    ],
                                  ),
                                ),
                                // Align icon to the center with respect to the column
                                Align(
                                    alignment: Alignment
                                        .topRight, // Align the icon to the center right
                                    child: Text('30 Mar\n18:51',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[500]))),
                              ],
                            ),
                          ),
                        ),

                        // second
                        TimelineTile(
                          alignment: TimelineAlign.start,
                          lineXY: 0.3,
                          indicatorStyle: IndicatorStyle(
                            width: 40,
                            height: 40,
                            color: Colors.transparent,
                            indicator: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(44, 99, 139, 1),
                                  width: 3,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            padding: const EdgeInsets.only(top: 0.1),
                            indicatorXY: 0.3,
                          ),
                          beforeLineStyle: const LineStyle(
                            color: Color.fromRGBO(44, 99, 139, 1),
                            thickness: 2.5,
                          ),
                          afterLineStyle: const LineStyle(
                            color: Colors
                                .transparent, // Color.fromRGBO(44, 99, 139, 1), // change to color
                            thickness: 2.5,
                          ),
                          endChild: Container(
                            constraints: const BoxConstraints(
                              minHeight: 75,
                            ),
                            padding: const EdgeInsets.only(top: 5, left: 25),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  // Expanded widget allows the text to fill available space,
                                  // pushing the icon to the right.
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Bring meter to Lab',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromRGBO(
                                                  44, 99, 139, 1),
                                              fontWeight: FontWeight.bold)),
                                      Text('View proof of delivery',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Color.fromRGBO(44, 99, 139, 1),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // third
                        TimelineTile(
                          alignment: TimelineAlign.start,
                          // lineXY: 0.3,
                          indicatorStyle: IndicatorStyle(
                            width: 40,
                            height: 40,
                            color: Colors.transparent,
                            indicator: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(53, 78, 21, 1),
                                  width: 3,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            padding: const EdgeInsets.only(top: 0.1),
                            indicatorXY: 0.3,
                          ),
                          beforeLineStyle: const LineStyle(
                            color: Colors.transparent,
                            thickness: 2.5,
                          ),
                          afterLineStyle: const LineStyle(
                            color: Colors
                                .transparent, // Color.fromRGBO(44, 99, 139, 1), // change to color
                            thickness: 2.5,
                          ),
                          endChild: Container(
                              constraints: const BoxConstraints(
                                minHeight: 75,
                              ),
                              padding: const EdgeInsets.only(top: 5, left: 25),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    // Expanded widget allows the text to fill available space,
                                    // pushing the icon to the right.
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Meter testing done',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromRGBO(
                                                    53, 78, 21, 1),
                                                fontWeight: FontWeight.bold)),
                                        Text('To be done by Air Selangor staff',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Color.fromRGBO(53, 78, 21, 1),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),

                        // fourth
                        TimelineTile(
                          alignment: TimelineAlign.start,
                          lineXY: 0.3,
                          indicatorStyle: IndicatorStyle(
                            width: 40,
                            height: 40,
                            color: Colors.transparent,
                            indicator: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(44, 99, 139, 1),
                                  width: 3,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            padding: const EdgeInsets.only(top: 0.1),
                            indicatorXY: 0.3,
                          ),
                          beforeLineStyle: const LineStyle(
                            color: Colors.transparent,
                            thickness: 2.5,
                          ),
                          afterLineStyle: const LineStyle(
                            color: Colors.transparent,
                            thickness: 2.5,
                          ),
                          endChild: Container(
                            constraints: const BoxConstraints(
                              minHeight: 75,
                            ),
                            padding: const EdgeInsets.only(top: 5, left: 25),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pick up meter from region store',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color.fromRGBO(44, 99, 139, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'View proof of pickup',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(44, 99, 139, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  "assets/icons/Notice.png",
                                  width: 30,
                                  height: 30,
                                ),
                                SizedBox(
                                    width:
                                        40), // Adjust the width between icon and text
                              ],
                            ),
                          ),
                        ),

                        // fifth
                        TimelineTile(
                          alignment: TimelineAlign.start,
                          lineXY: 0.3,
                          isLast: true,
                          indicatorStyle: IndicatorStyle(
                            width: 40,
                            height: 40,
                            color: Colors.transparent,
                            indicator: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(44, 99, 139, 1),
                                  width: 3,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            padding: const EdgeInsets.only(top: 0.1),
                            indicatorXY: 0.3,
                          ),
                          beforeLineStyle: const LineStyle(
                            color: Colors
                                .transparent, // Color.fromRGBO(44, 99, 139, 1), // change to color
                            thickness: 2.5,
                          ),
                          endChild: Container(
                            constraints: const BoxConstraints(
                              minHeight: 75,
                            ),
                            padding: const EdgeInsets.only(top: 5, left: 25),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  // Expanded widget allows the text to fill available space,
                                  // pushing the icon to the right.
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Re-install meter',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromRGBO(
                                                  44, 99, 139, 1),
                                              fontWeight: FontWeight.bold)),
                                      Text('View proof of completion',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[500])),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),

            // Camera icon at the bottom
            Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    icon: Image.asset("assets/icons/Camera.png",
                        width: 60, height: 60),
                    onPressed: () {
                      camera.onTapCameraButton(context);
                    }))
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
