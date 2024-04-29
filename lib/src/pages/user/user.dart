import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/user/homepage/add/complaint.dart';
import 'package:intelligent_meter_app/src/pages/user/homepage/FAQ/faq.dart';
import 'package:intelligent_meter_app/src/pages/user/homepage/water_activities/water_activities.dart';
import 'package:intelligent_meter_app/src/pages/user/homepage/bills/bills_carousel.dart';
import 'package:intelligent_meter_app/src/pages/user/navigation/bottom_nav.dart';
import 'package:intelligent_meter_app/src/pages/user/profile/user_profile.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
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
                        hintText: 'Search',
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.asset("assets/icons/Search.png",
                              width: 25, height: 25),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Container( 
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10),
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
                Gap(10),
                Complaint(),
                Gap(10),
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("Bills due",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
                Flexible(
                  child: BillsDueManager(),
                ),
                Gap(10),
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("Upcoming water activities",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
                Flexible(
                  child: Water_Activities(),
                ),
                Gap(10),
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("Need Help?",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
                Flexible(child: FAQ(),)
              ],
            ))),
        bottomNavigationBar: BottomNav(),
      ),
    );
  }
}
