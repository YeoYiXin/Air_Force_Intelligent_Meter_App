import "package:flutter/material.dart";
import "package:gap/gap.dart";

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: MediaQuery.of(context).size.height * 0.17,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Image.asset(
                    "assets/icons/Water_green.png",
                    width: 25,
                    height: 25,
                  ),
                ),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.only(left: 0, top: 10),
                  child: Text(
                    'Lab Testing Result',
                    style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gap(70),
                Padding(
                    padding: const EdgeInsets.only(right: 0, top: 10),
                    child: Row(
                      children: [
                        Text("View",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            )),
                        Gap(5),
                        IconButton(
                          icon: Image.asset(
                            "assets/icons/BigNext.png",
                            width: 20,
                            height: 20,
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => UserProfile())); // change this later
                          },
                        )
                      ],
                    )),
              ],
            ),

            Divider(
              color: Color.fromRGBO(229, 226, 225, 1),
              thickness: 1,
            ),

            // region
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 0, top: 5),
                    child: IconButton(
                      icon: Image.asset(
                        "assets/icons/Plus.png",
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
                    'Add Logs',
                    style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
