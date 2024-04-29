import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/complain/meter_complain.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/features/dummy_data_contractor.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/jobs/jobDetail/details.dart';

class TasksInProgress extends StatefulWidget {
  const TasksInProgress({super.key});

  @override
  State<TasksInProgress> createState() => _TasksInProgressState();
}

class _TasksInProgressState extends State<TasksInProgress> {
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: tasks.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(163, 176, 182, 1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Gap(10),
                  GestureDetector(
                      onTap: () {
                        //to complain form
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Details()));
                      },
                      child: Text(
                        task.taskId,
                        style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Gap(40),
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
                  Gap(40),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
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
                                      builder: (context) => Details()));
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
                                      builder: (context) => Details()));
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
