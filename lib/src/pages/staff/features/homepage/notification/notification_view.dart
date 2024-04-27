import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/homepage/notification/dummy_data.dart';
import 'package:intelligent_meter_app/src/pages/staff/navigation/bottom_nav.dart';

// show notification page
class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List<NotificationMessage> messages = [
    NotificationMessage(
      iconURL: "assets/icons/Location_green.png",
      title: 'Turn on location tracking when on duty',
      message: "Click to go turn on location tracking",
      date: "29 March 2024",
      time: "9:52 am",
      isRead: false,
    ),
    NotificationMessage(
      iconURL: "assets/icons/Wrench_green.png",
      title: 'New meter inspection task',
      message: "Click to go to location",
      date: "29 March 2024",
      time: "9:52 am",
      isRead: false,
    ),
    NotificationMessage(
      iconURL: "assets/icons/Car_black.png",
      title: 'Bring meter to laboratory',
      message: "Click to view task flow",
      date: "29 March 2024",
      time: "9:52 am",
      isRead: true,
    ),
    NotificationMessage(
      iconURL: "assets/icons/Wrench_black.png",
      title: 'Reinstall meter at customer premise',
      message: "Click to view job description",
      date: "29 March 2024",
      time: "9:52 am",
      isRead: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    List<NotificationMessage> unreadMessages =
        messages.where((element) => !element.isRead).toList();
    List<NotificationMessage> readMessages =
        messages.where((element) => element.isRead).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('NOTIFICATIONS'),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset("assets/icons/Previous.png", width: 25, height: 25),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Unread notifications
            // Gap(10),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                'Unread',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(44, 99, 139, 1),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),

            // Unread notification list
            if (unreadMessages.isNotEmpty) ...[
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: unreadMessages.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromRGBO(247, 249, 255,
                        1), // Light blue color for unread messages
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: SizedBox(
                      height: 150,
                      child: ListTile(
                        title: Text(unreadMessages[index].title,
                            style: TextStyle(
                                color: Color.fromRGBO(44, 99, 139, 1),
                                fontWeight: FontWeight.bold)),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                unreadMessages[index].message,
                                style: TextStyle(
                                    color: Color.fromRGBO(44, 99, 139, 1)),
                                textAlign: TextAlign.start,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.06),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Today",
                                          style: TextStyle(
                                              color: Colors.grey[600])),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(unreadMessages[index].date,
                                              style: TextStyle(
                                                  color: Colors.grey[600])),
                                          SizedBox(width: 10),
                                          Text(unreadMessages[index].time,
                                              style: TextStyle(
                                                  color: Colors.grey[600])),
                                        ],
                                      )
                                    ],
                                  )),
                            ]),
                        onTap: () {
                          /* Handle tap */
                        },
                      ),
                    ),
                  );
                },
              ),
            ],

            // read
            if (readMessages.isNotEmpty) ...[
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Past 7 days',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10, left: 190),
                            child: Text("Clear All",
                                style: TextStyle(
                                  fontSize: 15,
                                )))
                      ])),
              // Gap(10),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15), // Add padding here
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: readMessages.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white, // White color for read messages
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: SizedBox(
                      height: 150,
                      child: ListTile(
                        title: Text(readMessages[index].title,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                readMessages[index].message,
                                style: TextStyle(color: Colors.black87),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.06),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Today",
                                          style: TextStyle(
                                              color: Colors.grey[600])),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(readMessages[index].date,
                                              style: TextStyle(
                                                  color: Colors.grey[600])),
                                          SizedBox(width: 10),
                                          Text(readMessages[index].time,
                                              style: TextStyle(
                                                  color: Colors.grey[600])),
                                        ],
                                      )
                                    ],
                                  )),
                            ]),
                        onTap: () {
                          /* Handle tap */
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
