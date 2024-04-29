import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/staff/navigation/bottom_nav.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<String> places = [
    "Hydrolytics Metlab",
    "Gombak - store",
    "Petaling - store",
    "Klang - store"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Add your pages here
          Expanded(
            child: Stack(
              children: [
                // Background image
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Map.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 60, left: 20),
                      child: IconButton(
                        icon: Image.asset("assets/icons/Previous_map.png"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),

                // Search region store section
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.7 - 100,
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        // down and open in google maps
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_downward_outlined,
                                color: Color.fromRGBO(25, 96, 142, 1),
                              ),
                              onPressed: () {
                                //pull down
                              },
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(77, 189, 229, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Open in Google Maps",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Gap(10),
                                  Image.asset(
                                    "assets/icons/Next_map.png",
                                    width: 25,
                                    height: 25,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),

                        Gap(10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Search region store",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                //search
                              },
                            )
                          ],
                        ),

                        Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Frequently visited",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(25, 96, 142, 1),
                              ),
                            ),
                            Gap(90),
                            Text(
                              "Filter by region",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(25, 96, 142, 1),
                              ),
                            ),
                            Gap(10),
                            Image.asset(
                              "assets/icons/Funnel_blue.png",
                              width: 25,
                              height: 25,
                            )
                          ],
                        ),
                        Gap(10),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 110,
                            child: ListView.builder(
                              itemCount: places.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final place = places[index];
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(240, 240, 240, 1),
                                  ),
                                  child: Align( 
                                    alignment: Alignment.bottomRight,
                                    child:Row(
                                    children: [
                                      Gap(25),
                                      Image.asset("assets/icons/Star.png"),
                                      Gap(10),
                                      Text(place, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  ),
                                );
                              },
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
