import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/jobs/jobDetail/details.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/jobs/jobList/dummy_data.dart';
import 'package:intelligent_meter_app/src/pages/staff/navigation/bottom_nav.dart';

class Jobs extends StatefulWidget {
  const Jobs({Key? key}) : super(key: key);

  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  List<JobItem> jobTodo = [
    JobItem(
        title: '#1234 Meter Inspection',
        location: "Jalan Ipoh",
        date: "Mar 12",
        status: "In Progress",
        personInCharge: ["AD", "AD"],
        isCompleted: true),
    JobItem(
        title: '#1234 Meter Inspection',
        location: "Jalan Ipoh",
        date: "Mar 12",
        status: "In Progress",
        personInCharge: ["AD", "AD"],
        isCompleted: false),
    JobItem(
        title: '#1234 Meter Inspection',
        location: "Jalan Ipoh",
        date: "Mar 12",
        status: "In Progress",
        personInCharge: ["AD", "AD"],
        isCompleted: false),
  ];

  bool showCompleted = false; // false shows todo, true shows completed

  @override
  Widget build(BuildContext context) {
    List<JobItem> displayedJobs = showCompleted
        ? jobTodo.where((element) => element.isCompleted).toList()
        : jobTodo.where((element) => !element.isCompleted).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('All Assigned Jobs'),
        actions: [
          IconButton(
            icon: Image.asset(
              "assets/icons/Message.png",
              width: 24,
              height: 24,
            ),
            onPressed: () {
              // show message
            },
          ),
        ],
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // To do and Completed section
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          color:
                              showCompleted ? Colors.transparent : Colors.blue,
                          width: 2,
                        ),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showCompleted = false;
                        });
                      },
                      child: const Text('To Do'),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          color:
                              showCompleted ? Colors.blue : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showCompleted = true;
                        });
                      },
                      child: const Text('Completed'),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: displayedJobs.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final task = displayedJobs[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to Details page on tap
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Details(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Card(
                          // Wrap each task with a Card for better UI
                          margin: const EdgeInsets.all(8.0),

                          // change background colour of the card
                          color: Color.fromRGBO(255, 255, 255, 1),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(10),
                                // Title
                                Text(task.title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),

                                Gap(20),

                                // Location, Date, and Status in a row, each in a box
                                Wrap(
                                  spacing: 8.0, // Space between boxes
                                  children: [
                                    _buildBlueBox(
                                        "assets/icons/Location_blue.png",
                                        task.location),
                                    _buildGreenBox(
                                        "assets/icons/Date_green.png",
                                        task.date),
                                    _buildGreenBox("", task.status),
                                  ],
                                ),

                                Gap(20),

                                // Person in Charge in a wrap to allow for wrapping if many
                                Wrap(
                                  spacing: 8.0, // Space between boxes
                                  children: task.personInCharge
                                      .map((person) => _buildBlueBox(
                                          "assets/icons/PIC_blue.png", person))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
      bottomNavigationBar: BottomNav(),
    );
  }
}

// Utility method to create a box for each piece of data
Widget _buildBlueBox(String imagePath, String text) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(14, 102, 129, 1), // Border color
        ),
        borderRadius: BorderRadius.circular(4), // Rounded corners
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Use min size of Row
        children: [
          if (imagePath != "")
            Image.asset(imagePath, width: 16, height: 16), // Image icon
          SizedBox(width: 4), // Space between icon and text
          Text(text, style: TextStyle(color: Color.fromRGBO(14, 102, 129, 1))),
        ],
      ),
    );

// Utility method to create a box for each piece of data
Widget _buildGreenBox(String imagePath, String text) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(76, 102, 43, 1), // Border color
        ),
        borderRadius: BorderRadius.circular(4), // Rounded corners
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Use min size of Row
        children: [
          if (imagePath != "")
            Image.asset(imagePath, width: 16, height: 16), // Image icon
          SizedBox(width: 4), // Space between icon and text
          Text(text, style: TextStyle(color: Color.fromRGBO(76, 102, 43, 1))),
        ],
      ),
    );
