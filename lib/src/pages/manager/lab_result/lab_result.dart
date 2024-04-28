import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/lab_result/dummy_data.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';

class LabResult extends StatefulWidget {
  const LabResult({Key? key}) : super(key: key);

  @override
  _LabResultState createState() => _LabResultState();
}

class _LabResultState extends State<LabResult> {
  TextEditingController _serialNumberController = TextEditingController();
  bool _isTestPassed = true; // display pass results by default

  List<LabTestResult> labTestResult = [
    LabTestResult(
      testId: 'AIS17BA0013XXX',
      testResult: 'PASS',
      reused: 'To be reused',
    ),
    LabTestResult(
      testId: 'AIS17BA0013XXX',
      testResult: 'PASS',
      reused: 'Reused',
    ),
    LabTestResult(
      testId: 'AIS17BA0013XXX',
      testResult: 'PASS',
      reused: 'Reused',
    ),
    LabTestResult(
      testId: 'AIS17BA0013XXX',
      testResult: 'FAIL',
      reused: 'Reused',
    ),
  ];

  bool testResult = true;

  @override
  Widget build(BuildContext context) {
    List<LabTestResult> _TestPassed = testResult
        ? labTestResult
            .where((element) => element.testResult == "PASS")
            .toList()
        : labTestResult
            .where((element) => element.testResult == "FAIL")
            .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('VIEW LAB TEST RESULTS'),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset("assets/icons/Previous.png"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(children: [
          Row(
            children: [
              Gap(10),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey, // Adjust border color as needed
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.asset("assets/icons/Search_lab.png"),
                      onPressed: () {
                        // Perform search action here
                        print('Paste serial number');
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _serialNumberController,
                          onSubmitted: (value) {
                            // Perform search action here
                            _serialNumberController =
                                value as TextEditingController;
                            print('Searching for: $value');
                          },
                          decoration: InputDecoration(
                            hintText: 'Search contractor id',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10),
              GestureDetector(
                  onTap: () {
                    // Perform search action here
                    _serialNumberController.clear();
                    print('Search button pressed');
                  },
                  child: Text(
                    "Cancel",
                  )),
            ],
          ),

          Gap(10),
          // All pass or All Fail option
          Row(
            children: [
              Gap(10),

              // Pass
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isTestPassed = true;
                    testResult = true;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    color: _isTestPassed
                        ? Color.fromRGBO(77, 189, 229, 1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color.fromRGBO(
                          77, 189, 229, 1), // Adjust border color as needed
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "All Pass",
                      style: TextStyle(
                        color: _isTestPassed
                            ? Colors.white
                            : Color.fromRGBO(77, 189, 229, 1),
                      ),
                    ),
                  ),
                ),
              ),

              Gap(10),
              // Fail
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isTestPassed = false;
                    testResult = false;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    color: _isTestPassed
                        ? Colors.white
                        : Color.fromRGBO(77, 189, 229, 1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color.fromRGBO(
                          77, 189, 229, 1), // Adjust border color as needed
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "All Fail",
                      style: TextStyle(
                        color: _isTestPassed
                            ? Color.fromRGBO(77, 189, 229, 1)
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Gap(20),

          Expanded(
            child: ListView.builder(
                itemCount: _TestPassed.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final task = _TestPassed[index];
                  return Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        height: MediaQuery.of(context).size.height * 0.17,
                        padding: EdgeInsets.only(left: 30, right: 10, top: 10),
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black45,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Serial number"),
                                  Text(
                                    task.reused,
                                    style: TextStyle(
                                        color: Color.fromRGBO(141, 198, 65, 1)),
                                  )
                                ]),
                            Gap(10),

                            Text(
                              task.testId,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Gap(10),

                            Text(
                              "Latest test result",
                              style: TextStyle(
                                fontSize: 14,
                               
                              ),
                            ),

                            Gap(10),

                            Text(
                              task.testResult,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: task.testResult == "PASS"
                                    ? Color.fromRGBO(141, 198, 65, 1)
                                    : Color.fromRGBO(255, 0, 0, 1),
                              ),
                            ),  
                            
                          ],
                        )),
                  );
                }),
          )
        ]),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
