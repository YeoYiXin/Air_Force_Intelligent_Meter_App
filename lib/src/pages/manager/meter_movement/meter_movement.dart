import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/meter_movement/dummy_data.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';

class MeterMovementPage extends StatefulWidget {
  const MeterMovementPage({super.key});

  @override
  State<MeterMovementPage> createState() => _MeterMovementState();
}

class _MeterMovementState extends State<MeterMovementPage> {
  String meterStatus = "Shipping";
  //To ship, shipping, arrived
  List<MeterMovementArrival> meterMovementArrival = [
    MeterMovementArrival(
        meterName: "Water Meter 15 MM Plastic",
        trackId: "xxxxxxx",
        quantity: 1000,
        status: "Shipping",
        from: "Sabak Bernam - Store",
        to: "Sepang - Store",
        shipDate: "May 15, 2024",
        arrivalDate: "May 18-20, 2024"),
    MeterMovementArrival(
        meterName: "Water Meter 15 MM Plastic",
        trackId: "xxxxxxx",
        quantity: 1000,
        status: "To ship",
        from: "Sabak Bernam - Store",
        to: "Sepang - Store",
        shipDate: "May 15, 2024",
        arrivalDate: "May 18-20, 2024"),
    MeterMovementArrival(
        meterName: "Water Meter 15 MM Plastic",
        trackId: "xxxxxxx",
        quantity: 1000,
        status: "Arrived",
        from: "Sabak Bernam - Store",
        to: "Sepang - Store",
        shipDate: "May 15, 2024",
        arrivalDate: "May 18-20, 2024")
  ];

  @override
  Widget build(BuildContext context) {
    List<MeterMovementArrival> _meterMovement = meterMovementArrival
        .where((element) => element.status == meterStatus)
        .toList();
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

          Gap(10),

          // details
          Expanded(
              child: ListView.builder(
            itemCount: _meterMovement.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final tasks = _meterMovement[index];
              return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                  margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(14, 102, 129, 1), width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(250, 252, 255, 1),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tasks.meterName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(77, 182, 229, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                tasks.status,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          'Quantity: ${tasks.quantity.toString()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tracking number"),
                            Text(
                              tasks.trackId,
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                        Gap(10),
                        Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                      height: MediaQuery.of(context).size.height * 0.1,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(14, 102, 129, 1),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Transaction from",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                146, 144, 144, 1)),
                                      ),
                                      Text(
                                        tasks.from,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(14, 102, 129, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(20),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                       height: MediaQuery.of(context).size.height * 0.1,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(14, 102, 129, 1),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Transaction to",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                146, 144, 144, 1)),
                                      ),
                                      Text(
                                        tasks.to,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(14, 102, 129, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            //the lorry icon
                            Center(
                             
                                child:Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.only(top: 15, right:20),
                               
                                child: Image.asset("assets/icons/Transport.png")
                              
                              ),
                            ),
                          ],
                        ),


Gap(20),

                        Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                      height: MediaQuery.of(context).size.height * 0.1,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(14, 102, 129, 1),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Shipped on",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                146, 144, 144, 1)),
                                      ),
                                      Text(
                                        tasks.shipDate,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(14, 102, 129, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(20),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                       height: MediaQuery.of(context).size.height * 0.1,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(14, 102, 129, 1),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Received by",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                146, 144, 144, 1)),
                                      ),
                                      Text(
                                        tasks.arrivalDate,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(14, 102, 129, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                      ]));
            },
          ))
        ],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
