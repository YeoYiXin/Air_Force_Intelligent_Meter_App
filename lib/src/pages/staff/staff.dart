import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/homepage/transferRegion/region_card.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/jobs/camera/camera.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/profilePage/user_profile.dart';
import 'package:intelligent_meter_app/src/pages/staff/search/search.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/homepage/tasksCarousel/task_view.dart';
import 'package:intelligent_meter_app/src/pages/staff/navigation/bottom_nav.dart';
import 'package:intelligent_meter_app/src/pages/staff/notification.dart';

// staff homepage
class Staff extends StatefulWidget {
  const Staff({Key? key}) : super(key: key);

  @override
  _StaffState createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  final TextEditingController _searchController = TextEditingController();
  Camera camera = Camera();

  @override
  void initState() {
    super.initState();
    camera.onImageSelected = () {
      setState(() {});
    };
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(""), // Clear out the default title
            leading: IconButton(
              icon: Image.asset("assets/icons/Profile_blue.png",
                  width: 25, height: 25),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserProfile())),
            ),
            actions: [
              IconButton(
                icon: Image.asset("assets/icons/Notification_blue.png",
                    width: 25, height: 25),
                onPressed: () {},
              ),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 48,
                        right:
                            48), // Adjust left padding based on leading icon size and right padding as needed
                    child: Center(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search serial number',
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Image.asset("assets/icons/Search.png",
                                width: 25, height: 25),
                          ),
                          suffixIcon: IconButton(
                            icon: Image.asset("assets/icons/Scanner.png",
                                width: 25, height: 25),
                            onPressed: () {
                              _searchController.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          body: Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // notificatio message - change to if else later
                    Gap(10),
                    NotificationPage(),
                    Gap(20),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Welcome Back, \nKai Min",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(14, 102, 129, 1),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "In Progress",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(163, 176, 182, 1),
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "Select",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(14, 102, 129, 1),
                            ),
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    ),
                    // show the task in progress card
                    TasksInProgress(),
                    Gap(20),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Upcoming",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(163, 176, 182, 1),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    // show transfere region
                    TransferRegionNotice(),
                    Gap(20),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Completed",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Gap(150),
                          Text(
                            "View All",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          IconButton(
                              onPressed: () {
                                //search
                              },
                              icon: Icon(Icons.arrow_forward_ios))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Camera icon at the bottom
              Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      icon: Image.asset("assets/icons/Camera_blue.png",
                          width: 60, height: 60),
                      onPressed: () {
                        camera.onTapCameraButton(context);
                      }))
            ],
          ),
          bottomNavigationBar: BottomNav(),
        ));
  }
}
