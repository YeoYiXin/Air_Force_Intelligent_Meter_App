import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/manager/claim_process/dummy_data.dart';
import 'package:intelligent_meter_app/src/pages/manager/navigation/bottom_nav.dart';

class ClaimProcess extends StatefulWidget {
  const ClaimProcess({super.key});

  @override
  State<ClaimProcess> createState() => _ClaimProcessState();
}

class _ClaimProcessState extends State<ClaimProcess> {
  TextEditingController _serialNumberController = TextEditingController();
  bool canClaim = true;

  List<ClaimProcessData> labTestResult = [
    ClaimProcessData(
      testId: 'AIS17BA0013XXX',
      testResult: 'FAIL',
      canClaim: "YES",
    ),
    ClaimProcessData(
      testId: 'AIS17BA0013XXX',
      testResult: 'FAIL',
      canClaim: "YES",
    ),
    ClaimProcessData(
      testId: 'AIS17BA0013XXX',
      testResult: 'FAIL',
      canClaim: "YES",
    ),
    ClaimProcessData(
      testId: 'AIS17BA0013XXX',
      testResult: 'FAIL',
      canClaim: "NO",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<ClaimProcessData> _TestPassed = canClaim
        ? labTestResult.where((element) => element.canClaim == "YES").toList()
        : labTestResult.where((element) => element.canClaim == "NO").toList();

    return Scaffold(
      appBar: AppBar(
          title: Text('CLAIM PROCESS'),
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

        Gap(15),

        // Can Claim and Cannot Claim
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      canClaim = true;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.05,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: canClaim
                            ? Color.fromRGBO(14, 102, 129, 1)
                            : Colors
                                .transparent, // Adjust border color as needed
                        width: 2,
                      ),
                    )),
                    child: Center(
                      child: Text(
                        'Can Claim',
                        style: TextStyle(
                          fontSize: 16,
                          color: canClaim ? Colors.black87 : Colors.grey,
                        ),
                      ),
                    ),
                  )),
            ),
            Center(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      canClaim = false;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.05,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: canClaim
                            ? Colors.transparent
                            : Color.fromRGBO(14, 102, 129,
                                1), // Adjust border color as needed
                        width: 2,
                      ),
                    )),
                    child: Center(
                      child: Text(
                        'Cannot Claim',
                        style: TextStyle(
                          fontSize: 16,
                          color: canClaim ? Colors.grey : Colors.black87,
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),

        Gap(15),

        // Filter and Sort
        Row(children: [
          Gap(10),
          Text("Sort by latest"),
          Gap(10),
          Image.asset("assets/icons/Down.png"),
          Gap(20),
          Text("Filter by Petaling"),
          Gap(10),
          Image.asset("assets/icons/Funnel.png"),
          Gap(20),
          Text(
            "Claim all",
            style: TextStyle(
                color: Color.fromRGBO(14, 102, 129, 1),
                fontWeight: FontWeight.bold),
          ),
        ]),

        Gap(15),

        Expanded(
            child: ListView.builder(
          itemCount: _TestPassed.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final task = _TestPassed[index];
            return Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
                  padding: EdgeInsets.only(left: 30, right: 10, top: 10, bottom: 20),
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
                      // details
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Serial number"),
                          Gap(10),
                          Row(children: [
                            Text("Open Details",
                                style: TextStyle(
                                    color: Color.fromRGBO(141, 198, 65, 1))),
                            Image.asset("assets/icons/Next_green.png")
                          ])
                        ],
                      ),

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
                        "Result",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),

                      Gap(10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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

                          // Claim button
                          task.canClaim == "YES"
                              ? GestureDetector(
                                  onTap: () {
                                    // Perform claim action here
                                    print('Claiming for: ${task.testId}');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(14, 102, 129, 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      'Claim warranty',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      )
                    ],
                  )),
            );
          },
        ))
      ])),
      bottomNavigationBar: BottomNav(),
    );
  }
}
