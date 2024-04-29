import 'package:flutter/material.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';

class MeterMovementPage extends StatefulWidget {
  const MeterMovementPage({super.key});

  @override
  State<MeterMovementPage> createState() => _MeterMovementState();
}

class _MeterMovementState extends State<MeterMovementPage> {
  String meterStatus = "Shipping";
  //To ship, shipping, arrived

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('METER MOVEMENTS'),
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset(
              'assets/icons/Previous.png',
              width: 25,
              height: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Column(
        children: [
          //to ship, in transit, delivered
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    meterStatus = "To ship";
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: meterStatus == "To ship"
                          ? Color.fromRGBO(14, 102, 129, 1)
                          : Colors.transparent, // Adjust border color as needed
                      width: 2,
                    ),
                  )),
                  child: Center(
                    child: Text(
                      'To ship',
                      style: TextStyle(
                        fontSize: 16,
                        color: meterStatus == "To ship"
                            ? Colors.black87
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    meterStatus = "Shipping";
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: meterStatus == "Shipping"
                          ? Color.fromRGBO(14, 102, 129, 1)
                          : Colors.transparent,
                      // Adjust border color as needed
                      width: 2,
                    ),
                  )),
                  child: Center(
                    child: Text(
                      'In Transit',
                      style: TextStyle(
                        fontSize: 16,
                        color: meterStatus == "Shipping"
                            ? Colors.black87
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    meterStatus = "Arrived";
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: meterStatus == "Arrived"
                          ? Color.fromRGBO(14, 102, 129, 1)
                          : Colors.transparent, // Adjust border color as needed
                      width: 2,
                    ),
                  )),
                  child: Center(
                    child: Text(
                      'Delivered',
                      style: TextStyle(
                        fontSize: 16,
                        color: meterStatus == "Arrived"
                            ? Colors.black87
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
