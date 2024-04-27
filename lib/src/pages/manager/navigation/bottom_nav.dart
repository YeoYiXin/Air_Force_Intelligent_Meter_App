import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/analytics/analytics.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/job_details.dart';
import 'package:intelligent_meter_app/src/pages/manager/job/main_job.dart';
import 'package:intelligent_meter_app/src/pages/manager/manager.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/Home_nav.png",
            width: 24,
            height: 24,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/Jobs_nav.png",
            width: 24,
            height: 24,
          ),
          label: 'Jobs',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/Analytics.png",
            width: 24,
            height: 24,
          ),
          label: 'Analytics',
        ),
      ],
      selectedItemColor: Colors.amber[800],
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Manager()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JobManager()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Analytics()),
            );
            break;
        }
      },
    );
  }
}
