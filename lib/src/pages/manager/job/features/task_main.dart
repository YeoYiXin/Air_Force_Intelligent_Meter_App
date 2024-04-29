import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/features/dummy_data.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/job_details.dart';

class TaskList extends StatelessWidget {
  TaskList({super.key});

  final List<Task> tasks = [
    Task(
      taskName: "Meter Lab Testing",
      detailsDate: "Arrived on March 28th 2024",
    ),
    Task(
      taskName: "Transfer to region store",
      detailsDate: "Done testing on March 30th 2024",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          itemCount: tasks.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.6,
              margin: EdgeInsets.only(left: 10, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(163, 176, 182, 1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10),
                  Row(
                    children: [
                      Gap(10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
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
                            task.taskName,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward,
                            color: Color.fromRGBO(163, 176, 182, 1)),
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details()));
                        },
                      )
                    ],
                  ),
                  Gap(10),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.05,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(163, 176, 182, 1),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        
                        children: [
                          Gap(10),
                          Image.asset("assets/icons/Flag.png", width: 25, height: 25),
                           Gap(10),
                          Text(
                            task.detailsDate,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(163, 176, 182, 1),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            );
          },
        ));
  }
}
