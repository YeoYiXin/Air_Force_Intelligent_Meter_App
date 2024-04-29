import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        margin: EdgeInsets.only(top: 5, bottom: 10),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(10),
            //first containter
            GestureDetector(
                onTap: () {
                  //   Navigator.push(
                  //     context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PlacedOrder())); // change this later
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                     
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bill Payment",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                  "assets/images/Meter_Movement.png"),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Color.fromRGBO(14, 102, 129, 1),
                              ),
                              onPressed: () {
                                // Navigator.push(
                                // MaterialPageRoute(builder: (context) => PlaceOrder())
                                //);
                              },
                            )
                          ],
                        )
                      ],
                    ))),
                    Gap(20),
            //second container
            GestureDetector(
                onTap: () {
                  //   Navigator.push(
                  //     context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PlacedOrder())); // change this later
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                     
                      
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Water Meter Issues",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(23),
                           Image.asset(
                                  "assets/images/Meter_Movement.png"),
                            
                           
                         
                      ],
                    )))
          ],
        ));
  }
}
