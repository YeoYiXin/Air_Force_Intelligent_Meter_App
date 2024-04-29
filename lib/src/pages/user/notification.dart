import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/config/app_theme.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/homepage/notification/notification_view.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isNotificationVisible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isNotificationVisible,
      child: Padding(
        padding: EdgeInsets.only(top: 5),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.1,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppTheme.style().primaryColor,
            borderRadius: BorderRadius.circular(10), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationView()),
                      );
                    },
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset("assets/icons/Notification.png"),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                    Gap(20),
                      Expanded(
                        child: Text(
                          'Upcoming water disruption near you!',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                    //   ),
                    // ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isNotificationVisible = false;
                      });
                    },
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset("assets/icons/Close.png"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8), // Spacing between text and the row
              Padding(
                padding: const EdgeInsets.only(
                    left: 44), // Aligns with the notification icon
                child: RichText(
                  text: TextSpan(
                    text: 'See unread notifications',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
