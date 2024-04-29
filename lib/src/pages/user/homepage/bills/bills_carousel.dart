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
    ),
    BillsDue(
      billLocation: 'Sepang',
      billAmount: "RM 125.6",
      billDate: "June 10th 2024",
    ),
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
                          child: Center(
                            child: Text(
                              bill.billAmount,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward,
                              color: Color.fromRGBO(163, 176, 182, 1)),
                          onPressed: () {
                            // Perform action here
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details()));
                          },
                        ),
                      ],
                    ),
                    Gap(20),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(163, 176, 182, 1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
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
