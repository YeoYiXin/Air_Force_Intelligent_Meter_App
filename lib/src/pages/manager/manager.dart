import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/homepage/add/result.dart';
import 'package:intelligent_meter_app/src/pages/manager/homepage/inbox/complain_inbox.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';
import 'package:intelligent_meter_app/src/pages/manager/profile/manager_profile.dart';
import 'package:intelligent_meter_app/src/pages/manager/homepage/notification/notification.dart';

class Manager extends StatefulWidget {
  const Manager({Key? key}) : super(key: key);

  @override
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {
  final TextEditingController _searchController = TextEditingController();

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
            icon: Image.asset("assets/icons/Profile_nav.png",
                width: 25, height: 25),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ManagerProfile())),
          ),
          actions: [
            IconButton(
              icon: Image.asset("assets/icons/Bell_black.png",
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
                          icon: Text("Cancel", style: TextStyle(fontSize: 15)),
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NotificationPage(),
              Gap(10),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Welcome Back, \nKai Min",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(14,102,129,1),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Gap(10),
              Result(),
              Gap(10),
              ComplainInbox(),
            ],
          )
        ),
        bottomNavigationBar: BottomNav(),
      ),
    );
  }
}
