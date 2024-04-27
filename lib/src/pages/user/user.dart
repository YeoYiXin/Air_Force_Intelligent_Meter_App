import 'package:flutter/material.dart';
import 'package:intelligent_meter_app/src/pages/user/navigation/bottom_nav.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('User'),
        ),
        body: Center(
          child: Text('User Page'),
        ),
        bottomNavigationBar: BottomNav(),
      ),
    );
  }
}