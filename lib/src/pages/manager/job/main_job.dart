import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/features/contractor_task.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/features/filter_row.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/features/task_main.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';

class JobManager extends StatelessWidget {
  const JobManager({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: Column(
          children: [
            Gap(20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey, // Adjust border color as needed
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          onSubmitted: (value) {
                            // Perform search action here
                            print('Searching for: $value');
                          },
                          decoration: InputDecoration(
                            hintText: 'Search contractor id',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Image.asset("assets/icons/Filter.png"),
                      onPressed: () {
                        // Perform search action here
                        print('Search button pressed');
                      },
                    ),
                  ],
                ),
              ),
            ),
            Gap(10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Task Center",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(141, 198, 65, 1),
                  ),
                  child: Row(
                    children: [
                      Gap(15),
                      Text(
                        "Map View",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(228, 233, 236, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Image.asset("assets/icons/Map_light.png"),
                        onPressed: () {
                          // Perform search action here
                          print('Filter button pressed');
                        },
                      ),
                    ],
                  ))
            ]),
            Gap(10),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                children: [
                  Gap(20),
                  Text(
                    "My tasks",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(25, 92, 142, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(20),
                  Text(
                    "Sort by earliest",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(163, 176, 182, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(10),
                  IconButton(
                    icon: Image.asset("assets/icons/Up.png"),
                    onPressed: () {
                      // Perform action here
                      print('Sort by earliest');
                    },
                  )
                ],
              ),
            ),

            //Tasks
            TaskList(),

            Container(
              height: MediaQuery.of(context).size.height * 0.03,
              child: Row(
                children: [
                  Gap(20),
                  Text(
                    "Ongoing contractor tasks",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(25, 92, 142, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(20),
                  Text(
                    "Show all",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(163, 176, 182, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            Container(
              height: MediaQuery.of(context).size.height * 0.03,
              child: Row(
                children: [
                  Gap(20),
                  Text(
                    "Filter by Petaling",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(163, 176, 182, 1),
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(10),
                  IconButton(
                    icon: Image.asset("assets/icons/Funnel.png"),
                    onPressed: () {
                      // Perform action here
                      print('Funnel');
                    },
                  ),
                  Gap(20),
                  Text(
                    "Sort by latest",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(163, 176, 182, 1),
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(10),
                  IconButton(
                    icon: Image.asset("assets/icons/Down.png"),
                    onPressed: () {
                      // Perform action here
                      print('Sort by latest');
                    },
                  ),

                  
                ],
              ),
            ),

            //filter row
            FilterRow(),
            Gap(10),

            // Task
            ContractorTask(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
