import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';

class MeterComplainForm extends StatefulWidget {
  const MeterComplainForm({super.key});

  @override
  State<MeterComplainForm> createState() => _MeterComplainFormState();
}

class _MeterComplainFormState extends State<MeterComplainForm> {
  String _complaintController = "";
  String _noticeController = "";
  String _attachmentController = "";
  String _meterTypeController = "";
  String _meterManufacturerController = "";
  String _meterModelController = "";
  String _meterSizeController = "";
  final _formKey = GlobalKey<FormState>();
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
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Meter complain form",
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromRGBO(14, 102, 129, 1),
                    fontWeight: FontWeight.bold),
              ),
              Gap(10),
              Text(
                "Complaint details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              // complaint form
              Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Set the width to match the screen width
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.4, // Set the width of the first column
                              child: Text(
                                "Complain",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(146, 144, 144, 1),
                                ),
                              ),
                            ),
                            Expanded(
                              // Use Expanded to allow TextFormField to take remaining space
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Pooling around meter",
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 12,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the complaint';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  _complaintController = val;
                                },
                                onSaved: (value) {
                                  _complaintController = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Set the width to match the screen width
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.4, // Set the width of the first column
                              child: Text(
                                "First Noticed",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(146, 144, 144, 1),
                                ),
                              ),
                            ),
                            Expanded(
                              // Use Expanded to allow TextFormField to take remaining space
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "3 days ago",
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 12,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the complaint';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  _noticeController = val;
                                },
                                onSaved: (value) {
                                  _noticeController = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Set the width to match the screen width
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.4, // Set the width of the first column
                              child: Text(
                                "Attachment",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(146, 144, 144, 1),
                                ),
                              ),
                            ),
                            Expanded(
                              // Use Expanded to allow TextFormField to take remaining space
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "",
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 12,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the complaint';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  _attachmentController = val;
                                },
                                onSaved: (value) {
                                  _attachmentController = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(20),
                      Text(
                        "Meter details",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "AIS17BA0013XXX",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Gap(10),
                      Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Set the width to match the screen width
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.4, // Set the width of the first column
                              child: Text(
                                "Meter Type",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(146, 144, 144, 1),
                                ),
                              ),
                            ),
                            Expanded(
                              // Use Expanded to allow TextFormField to take remaining space
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText:
                                      "Mechanical Water - Brass Body & Piston Volumetric Type",
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 12,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the complaint';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  _meterTypeController = val;
                                },
                                onSaved: (value) {
                                  _meterTypeController = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Set the width to match the screen width
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.4, // Set the width of the first column
                              child: Text(
                                "Meter Manufacturer",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(146, 144, 144, 1),
                                ),
                              ),
                            ),
                            Expanded(
                              // Use Expanded to allow TextFormField to take remaining space
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "George Kent Malaysia",
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 12,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the complaint';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  _meterManufacturerController = val;
                                },
                                onSaved: (value) {
                                  _meterManufacturerController = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Set the width to match the screen width
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.4, // Set the width of the first column
                              child: Text(
                                "Meter Model",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(146, 144, 144, 1),
                                ),
                              ),
                            ),
                            Expanded(
                              // Use Expanded to allow TextFormField to take remaining space
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "PSM Volumetric 15mm",
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 12,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the complaint';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  _meterModelController = val;
                                },
                                onSaved: (value) {
                                  _meterModelController = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Set the width to match the screen width
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.4, // Set the width of the first column
                              child: Text(
                                "Meter Size",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(146, 144, 144, 1),
                                ),
                              ),
                            ),
                            Expanded(
                              // Use Expanded to allow TextFormField to take remaining space
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "15",
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 12,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the complaint';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  _meterSizeController = val;
                                },
                                onSaved: (value) {
                                  _meterSizeController = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
Gap(10),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(77, 189, 229, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process the data
                        print('Complaint: $_complaintController');
                        print('First Noticed: $_noticeController');
                        print('Attachment: $_attachmentController');
                        print('Meter Type: $_meterTypeController');
                        print('Meter Manufacturer: $_meterManufacturerController');
                        print('Meter Model: $_meterModelController');
                        print('Meter Size: $_meterSizeController');
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
