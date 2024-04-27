import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/manager.dart';
import 'package:intelligent_meter_app/src/pages/staff/staff.dart';
import 'package:intelligent_meter_app/src/pages/user/user.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        margin:  MediaQuery.of(context).padding,
        child: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  const Row(
                    children: [
                      Text('Choose a user: '),
                    ],
                  ),
                  const Gap(20),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Manager()),
                          );
                        },
                        //navigate
                        child: const Text("Manager"),
                      ),
                      Gap(20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Staff()),
                          );
                        },
                        //navigate
                        child: const Text("Staff"),
                      ),
                      const Gap(20),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to User page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const User()),
                          );
                        },
                        //navigate
                        child: const Text("User"),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
    ),
    );

  }
}
