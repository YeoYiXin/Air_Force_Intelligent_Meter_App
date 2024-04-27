import 'package:flutter/material.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/features/dummy_data_contractor.dart';

class ContractorTask extends StatefulWidget {
  const ContractorTask({super.key});

  @override
  State<ContractorTask> createState() => _ContractorTaskState();
}

class _ContractorTaskState extends State<ContractorTask> {
  final List<ContractorDummyData> tasks=[
    ContractorDummyData(
      taskId:"01586564",
      taskName:"Meter inspection",
      taskDate: "March 30",
      contractorName: "CH",
    ),
    ContractorDummyData(
      taskId:"01586564",
      taskName:"Meter inspection",
      taskDate: "March 17",
      contractorName: "AD",
    ),
     ContractorDummyData(
      taskId:"0158226564",
      taskName:"Meter inspection",
      taskDate: "March 17",
      contractorName: "AD",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.3,
      child: ListView.builder(
        itemCount: tasks.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.only(top: 0, bottom: 8, left: 16, right:16),
            child: ListTile(
              title: Text(tasks[index].taskName),
              subtitle: Text(tasks[index].taskId),
            ),
          );
        },
      )
    );
  }
}