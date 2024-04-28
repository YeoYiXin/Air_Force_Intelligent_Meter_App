import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/movement/place_order/dummy_data.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';

class PlacedOrder extends StatefulWidget {
  const PlacedOrder({super.key});

  @override
  State<PlacedOrder> createState() => _PlacedOrderState();
}

class _PlacedOrderState extends State<PlacedOrder> {
  bool autoGenerateOrder = true;
  String meterStatus = "Shipping";

  // In transit == Shipping
  // To pay == Payment Due
  // Delivered == Arrived

  List<PlaceOrderTask> placeOrderTask = [
    PlaceOrderTask(
        meterId: "15 MM",
        quantity: 10000,
        status: "Shipping",
        from: "KLANG",
        to: "STORE"),
    PlaceOrderTask(
        meterId: "15 MM",
        quantity: 10000,
        status: "Shipping",
        from: "KLANG",
        to: "STORE"),
    PlaceOrderTask(
        meterId: "15 MM",
        quantity: 10000,
        status: "Payment Due",
        from: "KLANG",
        to: "STORE"),
    PlaceOrderTask(
        meterId: "15 MM",
        quantity: 10000,
        status: "Payment Due",
        from: "KLANG",
        to: "STORE"),
    PlaceOrderTask(
        meterId: "15 MM",
        quantity: 10000,
        status: "Arrived",
        from: "KLANG",
        to: "STORE"),
    PlaceOrderTask(
        meterId: "15 MM",
        quantity: 10000,
        status: "Arrived",
        from: "KLANG",
        to: "STORE"),
    PlaceOrderTask(
        meterId: "15 MM",
        quantity: 10000,
        status: "Arrived",
        from: "KLANG",
        to: "STORE"),
    PlaceOrderTask(
        meterId: "15 MM",
        quantity: 10000,
        status: "Arrived",
        from: "KLANG",
        to: "STORE"),
  ];

  @override
  Widget build(BuildContext context) {
    List<PlaceOrderTask> _placeOrderTaskTransit = placeOrderTask
        .where((element) => element.status == meterStatus)
        .toList();
    return Scaffold(
      appBar: AppBar(
          title: Text('PLACED ORDERS'),
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
          SwitchListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Gap(10),
                    Image.asset("assets/icons/Notice_black.png"),
                    Gap(10),
                    Text("Auto generate purchase order to vendor",
                        style: TextStyle(fontSize: 11)),
                    Gap(10),
                  ],
                ),
              ],
            ),
            value: autoGenerateOrder,
            activeColor: Color.fromRGBO(25, 96, 142, 1),
            inactiveThumbColor: Color.fromRGBO(25, 96, 142, 1),
            inactiveTrackColor: Color.fromRGBO(217, 217, 217, 1),
            onChanged: (bool value) {
              setState(() {
                autoGenerateOrder = value;
              });
            },
            dense: true,
          ),

          // to pay, in transit and delivered
// Can Claim and Cannot Claim
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    meterStatus = "Payment Due";
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
                      color: meterStatus == "Payment Due"
                          ? Color.fromRGBO(14, 102, 129, 1)
                          : Colors.transparent, // Adjust border color as needed
                      width: 2,
                    ),
                  )),
                  child: Center(
                    child: Text(
                      'To pay',
                      style: TextStyle(
                        fontSize: 16,
                        color: meterStatus == "Payment Due"
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

          // stuff
          // In transit == Shipping
          // To pay == Payment Due
          // Delivered == Arrived
          Expanded(
              child: ListView.builder(
            itemCount: _placeOrderTaskTransit.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final tasks = _placeOrderTaskTransit[index];
              return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.13,
                  margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(14, 102, 129, 1), width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(250, 252, 255, 1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tasks.meterId,
                            style: TextStyle(
                                color: Color.fromRGBO(14, 102, 129, 1),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            tasks.status,
                            style: TextStyle(
                                color: Color.fromRGBO(77, 189, 229, 1),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //quantity
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.04,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromRGBO(14, 102, 129, 1),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                tasks.quantity.toString(),
                                style: TextStyle(
                                  color: Color.fromRGBO(14, 102, 129, 1),
                                ),
                              ),
                            ),
                          ),

                          Text(
                            "To ${tasks.from} - ${tasks.to}",
                            style: TextStyle(
                              color: Color.fromRGBO(14, 102, 129, 1),
                            ),
                          )
                        ],
                      )
                    ],
                  ));
            },
          ))
        ],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
