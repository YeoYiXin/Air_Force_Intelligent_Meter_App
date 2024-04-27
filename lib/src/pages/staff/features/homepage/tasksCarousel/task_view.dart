import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/homepage/tasksCarousel/dummy_data.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/jobs/jobDetail/details.dart';

class TasksInProgress extends StatelessWidget {
  const TasksInProgress({super.key});

  @override
  Widget build(BuildContext context) {
    // dummy data
    List<Task> tasks = [
      Task(
          title: '#1234 Meter Inspection',
          location: "Jalan Ipoh",
          date: "Mar 12",
          status: "In Progress",
          personInCharge: ["AD", "AD"]),
      Task(
          title: '#1234 Meter Inspection',
          location: "Jalan Ipoh",
          date: "Mar 12",
          status: "In Progress",
          personInCharge: ["AD", "AD"]),
      Task(
          title: '#1234 Meter Inspection',
          location: "Jalan Ipoh",
          date: "Mar 12",
          status: "In Progress",
          personInCharge: ["AD", "AD"])
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      color: Color.fromRGBO(247, 249, 255, 1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('Tasks In Progress',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: tasks.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final task = tasks[index];
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
                    height: 50,
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
                                style: TextStyle(fontWeight: FontWeight.bold)),

                            Gap(20),

                            // Location, Date, and Status in a row, each in a box
                            Wrap(
                              spacing: 8.0, // Space between boxes
                              children: [
                                _buildBlueBox("assets/icons/Location_blue.png",
                                    task.location),
                                _buildGreenBox(
                                    "assets/icons/Date_green.png", task.date),
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
      ),
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
