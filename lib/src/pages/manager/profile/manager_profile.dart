import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';

class ManagerProfile extends StatefulWidget {
  const ManagerProfile({super.key});

  @override
  State<ManagerProfile> createState() => _ManagerProfileState();
}

class _ManagerProfileState extends State<ManagerProfile> {
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
                              padding: const EdgeInsets.only(left: 20, ),
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
                                'Manager',
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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: MediaQuery.of(context).size.height * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // gmail
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Gap(20),
                            Padding(
                              padding: const EdgeInsets.only(left: 0, top: 12),
                              child: Text(
                                'Gmail',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Gap(65),
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 0, top: 12),
                                child: Text("kwaywin@gmail.com",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey[600],
                                    ))),
                          ],
                        ),

                        Divider(
                          color: Color.fromRGBO(229, 226, 225, 1),
                          thickness: 1,
                        ),

                        // region
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Gap(20),
                            Padding(
                              padding: const EdgeInsets.only(left: 0, top: 0, bottom: 5),
                              child: Text(
                                'Region',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Gap(170),
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 0, top: 5, bottom: 5),
                                child: Text("Serdang",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey[600],
                                    ))),
                          ],
                        ),
                      ],
                    )),
                    Gap(40),
                Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // password

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 0, top: 0),
                              child: IconButton(
                                icon: Image.asset(
                                    "assets/icons/Password_green.png",
                                    width: 25,
                                    height: 25),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            Gap(20),
                            Padding(
                              padding: const EdgeInsets.only(left: 0, top: 0),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Gap(130),
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

                        // Sign out
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 0, top: 0),
                              child: IconButton(
                                icon: Image.asset(
                                    "assets/icons/Logout_green.png",
                                    width: 25,
                                    height: 25),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            Gap(20),
                            Padding(
                              padding: const EdgeInsets.only(left: 0, top: 0),
                              child: Text(
                                'Sign out',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ]),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
