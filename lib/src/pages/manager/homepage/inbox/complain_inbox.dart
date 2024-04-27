import "package:flutter/material.dart";

class ComplainInbox extends StatefulWidget {
  const ComplainInbox({Key? key}) : super(key: key);

  @override
  _ComplainInboxState createState() => _ComplainInboxState();
}

class _ComplainInboxState extends State<ComplainInbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          // Words
          children: [
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Order Updates",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // complain notification number
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Color.fromRGBO(187, 233, 255, 1),
                        child: Text(
                          "0",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            // customer complain box
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "No complains yet",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ));
  }
}
