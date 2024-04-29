import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Water_Activities extends StatefulWidget {
  const Water_Activities({super.key});

  @override
  _Water_Activities createState() => _Water_Activities();
}

class _Water_Activities extends State<Water_Activities> {
  @override
  Widget build(BuildContext context) {
      return Container(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.15,
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromRGBO(163, 176, 182, 1), width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(250, 252, 255, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 29, 49, 1)),
                    ),
                    Gap(5),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(250, 252, 255, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          "ETA: 2pm",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Gap(5),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(141, 198, 65, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(141, 198, 65, 1),
                        ),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          "Scheduled",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(5),
                Text(
                  "Planned water supply upgrade works at Jalan SS17/1, SS17",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(129, 128, 129, 1),
                  ),
                ),
              ],
            )));
  }
}
