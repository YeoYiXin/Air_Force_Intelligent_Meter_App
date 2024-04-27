import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/homepage/transferRegion/region_card.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/profilePage/user_profile.dart';
import 'package:intelligent_meter_app/src/pages/staff/search/search.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/homepage/tasksCarousel/task_view.dart';
import 'package:intelligent_meter_app/src/pages/staff/navigation/bottom_nav.dart';
import 'package:intelligent_meter_app/src/pages/staff/notification.dart';

// staff homepage
class Staff extends StatelessWidget {
  const Staff({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              Container(
                margin: MediaQuery.of(context).padding,
                child: Column(
                  children: [
                    // notificatio message - change to if else later
                    Gap(10),
                    NotificationPage(),
                    Gap(20),
                    // show the task in progress card
                    TasksInProgress(),
                    Gap(20),
                    // show transfere region
                    TransferRegionNotice(),
                  ],
                ),
              ),
              Positioned(
                bottom:
                    kBottomNavigationBarHeight-50, // Positioned above the navigation bar
                left: 8,
                right: 8,
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    alignment: Alignment.center,
                    // color: Color.fromRGBO(206, 237, 163, 1),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(206, 237, 163, 1),
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(10),
                        Image.asset(
                          "assets/icons/SOP.png",
                          width: 30,
                          height: 30,
                        ),
                        Gap(20),
                        Text(
                          "Tap here to read the latest guidelines!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UserProfile())); // change this later
                          },
                          icon: Image.asset(
                            "assets/icons/Next.png",
                            width: 30,
                            height: 30,
                          ),
                          color: Colors.black,
                        ),
                      ],
                    )),
              ),
            ],
          ),
          bottomNavigationBar: BottomNav(),
        ));
  }
}
