import 'package:flutter/material.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';

class MeterComplainForm extends StatefulWidget {
  const MeterComplainForm({super.key});

  @override
  State<MeterComplainForm> createState() => _MeterComplainFormState();
}

class _MeterComplainFormState extends State<MeterComplainForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('SUBMIT NEW COMPLAINT'),
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
