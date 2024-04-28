import 'package:flutter/material.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';

class MeterMovement extends StatefulWidget {
  const MeterMovement({super.key});

  @override
  State<MeterMovement> createState() => _MeterMovementState();
}

class _MeterMovementState extends State<MeterMovement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('METER MOVEMENT'),
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset(
              'assets/icons/Previous.png',
              width: 25,
              height: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      bottomNavigationBar: BottomNav(),
    );
  }
}
