import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/staff/navigation/bottom_nav.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset("assets/icons/Previous.png", width: 25, height: 25),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // Profile container
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              color: Color.fromRGBO(14, 102, 129, 1),
              child: Center(
                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Profile_bg.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // introduction
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/AirSelangor.png",
                                width: 120),
                            Gap(5),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Alif | AM',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Contractor',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                '0368211',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                '+60123456789',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // profile picture
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/Contractor.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),

            // User setting
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35 - 30,
              right: 20,
              left: 20,
              child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // location tracking
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 5),
                            child: IconButton(
                              icon: Image.asset(
                                  "assets/icons/Location_green.png",
                                  width: 25,
                                  height: 25),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          Gap(20),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 5),
                            child: Text(
                              'Location Tracking',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Gap(45),
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 5),
                            child: IconButton(
                              icon: Image.asset("assets/icons/Toggle.png",
                                  width: 30, height: 30),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),

                      Divider(
                        color: Color.fromRGBO(229, 226, 225, 1),
                        thickness: 1,
                      ),

                      // account information
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 0),
                            child: IconButton(
                              icon: Image.asset(
                                  "assets/icons/Profile_green.png",
                                  width: 25,
                                  height: 25),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          Gap(20),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 0),
                            child: Text(
                              'Account Information',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Gap(20),
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 0),
                            child: IconButton(
                              icon: Image.asset("assets/icons/BigNext.png",
                                  width: 25, height: 25),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),

                      Divider(
                        color: Color.fromRGBO(229, 226, 225, 1),
                        thickness: 1,
                      ),

                      // Notification
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 0),
                            child: IconButton(
                              icon: Image.asset("assets/icons/Bell_green.png",
                                  width: 25, height: 25),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          Gap(20),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 0),
                            child: Text(
                              'Notification',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Gap(100),
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 0),
                            child: IconButton(
                              icon: Image.asset("assets/icons/BigNext.png",
                                  width: 25, height: 25),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),

                      Divider(
                        color: Color.fromRGBO(229, 226, 225, 1),
                        thickness: 1,
                      ),

                      // FAQ
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 0),
                            child: IconButton(
                              icon: Image.asset("assets/icons/FAQ_green.png",
                                  width: 25, height: 25),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          Gap(20),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 0),
                            child: Text(
                              'FAQ',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Gap(170),
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 0),
                            child: IconButton(
                              icon: Image.asset("assets/icons/BigNext.png",
                                  width: 25, height: 25),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),

                      Divider(
                        color: Color.fromRGBO(229, 226, 225, 1),
                        thickness: 1,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0, top: 0),
                            child: IconButton(
                              icon: Image.asset("assets/icons/Logout_green.png",
                                  width: 25, height: 25),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          Gap(20),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 0),
                            child: Text(
                              'Sign Out',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
