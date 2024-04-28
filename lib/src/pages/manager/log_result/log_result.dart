import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting

class LogResultPage extends StatefulWidget {
  @override
  _LogResultPageState createState() => _LogResultPageState();
}

class _LogResultPageState extends State<LogResultPage> {
  final _formKey = GlobalKey<FormState>();
  final sDateFormate = "dd/MM/yyyy";
  String _meterSample = '';
  String _serialNumber = '';
  String dateValue = DateFormat('dd/MM/yyyy').format(DateTime.now());
  DateTime _testedDate = DateTime.now();
  String _region = '';
  bool _isTestPassed = false;
  String _defectReason = '';

  @override
  void initState() {
    super.initState();

    dateValue = new DateFormat(sDateFormate).format(_testedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('LOG METER TEST RESULT'),
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "A1S17BA0013XXX",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: 'Meter Sample Serial Number',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12), // Adjust padding as needed
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the meter sample serial number';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      _meterSample = val;
                    },
                    onSaved: (value) {
                      _meterSample = value!;
                    },
                  ),
                  Gap(30),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: dateValue,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: 'Tested Date',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12), // Adjust padding as needed
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    readOnly: true,
                    controller: TextEditingController(
                      text: DateFormat('dd/MM/yyyy')
                          .format(_testedDate), // Format the date without time
                    ),
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        locale: const Locale('en', null),
                        context: context,
                        initialDate: DateFormat(sDateFormate).parse(dateValue),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null && picked != _testedDate) {
                        setState(() {
                          _testedDate = picked;
                          dateValue = DateFormat(sDateFormate).format(picked);
                        });
                      }
                    },
                  ),
                  Gap(30),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Sabak Bernam",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: 'Region',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12), // Adjust padding as needed
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the regionr';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      _region = val;
                    },
                    onSaved: (value) {
                      _region = value!;
                    },
                  ),
                  Gap(30),
                  Text(
                    'Select Lab Test Result',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // If the Fail container is tapped, set Fail as selected and Pass as unselected
                            _isTestPassed = false;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(25, 96, 142, 1)),
                            borderRadius: BorderRadius.circular(5),
                            color: _isTestPassed
                                ? Colors.transparent
                                : Color.fromRGBO(25, 96, 142, 1),
                          ),
                          child: Center(
                            child: Text(
                              'Fail',
                              style: TextStyle(
                                color: _isTestPassed
                                    ? Color.fromRGBO(25, 96, 142, 1)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // If the Pass container is tapped, set Pass as selected and Fail as unselected
                            _isTestPassed = true;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(141, 198, 65, 1)),
                            borderRadius: BorderRadius.circular(5),
                            color: _isTestPassed
                                ? Color.fromRGBO(141, 198, 65, 1)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              'Pass',
                              style: TextStyle(
                                color: _isTestPassed
                                    ? Colors.white
                                    : Color.fromRGBO(141, 198, 65, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Inaccurate readings",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: 'Write Defect Reason',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12), // Adjust padding as needed
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the regionr';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      _defectReason = val;
                    },
                    onSaved: (value) {
                      _defectReason = value!;
                    },
                  ),
                  Gap(60),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(77, 189, 229, 1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/Save.png',
                              width: 25, height: 25),
                          Gap(20),
                          Text('Log Result',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ]),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // TODO: Perform submit logic here
                      }
                    },
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
