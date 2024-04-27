import 'package:flutter/material.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/features/dummy_data.dart';

class TaskList extends StatelessWidget {

  TaskList({super.key});

  final List<Task> tasks=[
    Task(
      taskName:"Meter Lab Testing",
      detailsDate: "Arrived on March 28th 2024",
    ),
    Task(
      taskName:"Transfer to region store",
      detailsDate: "Done testing on March 30th 2024",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.25,
        child:  ListView.builder(
          itemCount: tasks.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.only(top: 0, bottom: 8, left: 16, right:16),
              child: ListTile(
                title: Text(tasks[index].taskName),
                subtitle: Text(tasks[index].detailsDate),
              ),
            );
          },
        )
    );
  }
}