import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:intelligent_meter_app/src/pages/manager/claim_process/claim_process.dart";
import "package:intelligent_meter_app/src/pages/manager/lab_result/lab_result.dart";
import "package:intelligent_meter_app/src/pages/manager/log_result/log_result.dart";

class Complaint extends StatefulWidget {
  const Complaint({Key? key}) : super(key: key);

  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // region
            GestureDetector(
              onTap: () {
                //Navigator.push(
                  //  context,
                    //MaterialPageRoute(
                      //  builder: (context) =>
                        //    ClaimProcess())); // change this later
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 0, top: 0),
                      child: IconButton(
                        icon: Image.asset(
                          "assets/icons/Edit_clear.png",
                          width: 30,
                          height: 30,
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => UserProfile())); // change this later
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 5),
                    child: Text(
                      'View Complaint Progress',
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color.fromRGBO(229, 226, 225, 1),
              thickness: 1,
            ),
            GestureDetector(
              //onTap: () {
              //  Navigator.push(
                //    context,
                  //  MaterialPageRoute(
                    //    builder: (context) =>
                      //      LabResult())); // change this later
              //},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Image.asset(
                      "assets/icons/Add.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                  Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 10),
                    child: Text(
                      'Make a Complaint',
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
