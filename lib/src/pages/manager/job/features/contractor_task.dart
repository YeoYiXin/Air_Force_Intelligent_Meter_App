import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/complain/meter_complain.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/features/dummy_data_contractor.dart';

class ContractorTask extends StatefulWidget {
  const ContractorTask({super.key});

  @override
  State<ContractorTask> createState() => _ContractorTaskState();
}

class _ContractorTaskState extends State<ContractorTask> {
  final List<ContractorDummyData> tasks = [
    ContractorDummyData(
      taskId: "01586564",
      taskName: "Meter inspection",
      taskDate: "March 30",
      contractorName: "CH",
    ),
    ContractorDummyData(
      taskId: "01586564",
      taskName: "Meter inspection",
      taskDate: "March 17",
      contractorName: "AD",
    ),
    ContractorDummyData(
      taskId: "0158226564",
      taskName: "Meter inspection",
      taskDate: "March 17",
      contractorName: "AD",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.25,
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: tasks.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Container(
              margin: EdgeInsets.only(left: 10, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(163, 176, 182, 1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(5),
                      GestureDetector(
                          onTap: () {
                            //to complain form
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MeterComplainForm()));
                          },
                          child: Text(
                            task.taskId,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(77, 199, 229, 1),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color.fromRGBO(77, 199, 229, 1),
                            ),
                          ),
                          child: Text(
                            task.taskName,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MeterComplainForm()));
                        },
                      )
                    ]),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(163, 176, 182, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Image.asset("assets/icons/Calendar_gray.png",
                                width: 30, height: 30),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MeterComplainForm()));
                            },
                          ),
                          Text(
                            task.taskDate,
                            style: TextStyle(
                              color: Color.fromRGBO(163, 176, 182, 1),
                            ),
                          ),
                          Gap(5),
                        ],
                      ),
                    ),
                    Gap(10),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      margin: EdgeInsets.only(left: 10, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(163, 176, 182, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Image.asset("assets/icons/Profile_grey.png",
                                width: 30, height: 30),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MeterComplainForm()));
                            },
                          ),
                          Text(
                            task.contractorName,
                            style: TextStyle(
                              color: Color.fromRGBO(163, 176, 182, 1),
                            ),
                          ),
                          Gap(5),
                        ],
                      ),
                    )
                  ],
                )
              ]),
            );
          },
        ));
  }
}
