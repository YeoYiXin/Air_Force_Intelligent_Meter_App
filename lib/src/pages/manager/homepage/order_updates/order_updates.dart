import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/movement/place_order/placed_order.dart';

class Order_Updates extends StatelessWidget {
  const Order_Updates({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlacedOrder())); // change this later
        },
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "15 MM - 10,000 (KLANG - STORE)",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(25, 96, 142, 1)),
                    ),
                    Text(
                      "Delivered",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(141, 198, 65, 1)),
                    )
                  ],
                ),
                Gap(10),
                Text(
                  "2:01pm, 10/04/2024",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(25, 96, 142, 1),
                  ),
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(77, 199, 229, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(77, 199, 229, 1),
                        ),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          "Order Received",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "View proof of delivery",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(25, 96, 142, 1),
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromRGBO(25, 96, 142, 1),
                          ),
                        ))
                  ],
                ),
              ],
            )));
  }
}
