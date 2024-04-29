import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/user/homepage/bills/dummy_data.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/features/dummy_data.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/job_details.dart';

class BillsDueManager extends StatelessWidget {
  final List<BillsDue> bills = [
    BillsDue(
      billLocation: 'Bandar Utama',
      billAmount: "RM47.4",
      billDate: "May 1st 2024",
    ),
    BillsDue(
      billLocation: 'Taman Tun Dr Ismail',
      billAmount: "RM96.5",
      billDate: "May 29st 2024",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.15,
        margin: EdgeInsets.only(left: 10),
        child: ListView.builder(
          itemCount: bills.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final bill = bills[index];
            return Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(163, 176, 182, 1),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.03,
                        child: Row(
                            children: [Text(
                              bill.billLocation,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            ],
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Center(
                            child: Text(
                              bill.billAmount,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(14, 102, 129, 1),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Image.asset(
                          "assets/icons/View.png",
                          width: 30,
                          height: 30),
                          onPressed: () {
                            // Perform action here
                           // Navigator.push(
                             //   context,
                               // MaterialPageRoute(
                                 //   builder: (context) => Details()));
                          },
                        ),
                      ],
                    ),
                    Gap(5),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Row(
                          children: [
                            Gap(10),
                            Text(
                              "Pay by " + bill.billDate,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(163, 176, 182, 1),
                              ),
                            ),
                          ],
                        ))
                  ],
                ));
          },
        ));
  }
}
