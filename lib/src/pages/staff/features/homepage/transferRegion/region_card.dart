import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/homepage/transferRegion/dummy_data.dart';

class TransferRegionNotice extends StatefulWidget {
  const TransferRegionNotice({super.key});

  @override
  State<TransferRegionNotice> createState() => _TransferRegionNoticeState();
}

class _TransferRegionNoticeState extends State<TransferRegionNotice> {
  List<TransferRegion> transferRegion = [
    TransferRegion(
        from: "Sabak Bernam",
        materials: "WATER METER 15MM PLASTIC - KSM",
        status: "Delivering",
        id: "XXXXX",
        to: "Sepang"),
    TransferRegion(
        from: "Sabak Bernam",
        materials: "WATER METER 15MM PLASTIC - KSM",
        status: "Delivering",
        id: "XXXXX",
        to: "Sepang"),
    TransferRegion(
        from: "Sabak Bernam",
        materials: "WATER METER 15MM PLASTIC - KSM",
        status: "Delivering",
        id: "XXXXX",
        to: "Sepang")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "To Transfer-to Region Store",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // show the transfer region card
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: transferRegion.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final transfer = transferRegion[index];
                return Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 220,
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right:
                                    8.0), // Add some spacing between the icon and the text
                            child: Image.asset(
                              "assets/images/Location_Frame.png",
                              width: 60, // Specify your desired width
                              height: 420, // Specify your desired height
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(10),
                                Text(
                                  "From  ${transfer.from}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(44, 99, 139, 1)),
                                ),
                                Gap(10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap(10),
                                    Image.asset("assets/icons/Lorry.png",
                                        width: 20, height: 20),
                                    Gap(20),
                                    Text(
                                      "2024/25",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromRGBO(146, 144, 144, 1)),
                                    ),
                                  ],
                                ),
                                Gap(10),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${transfer.materials}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            Color.fromRGBO(146, 144, 144, 1)),
                                  ),
                                ),
                                Gap(10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Gap(10),
                                    Wrap(
                                        spacing: 2.0, // Space between boxes
                                        children: [
                                          _buildGreenBox(transfer.status),
                                        ]),
                                    Gap(50),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Tracking Number",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Gap(5),
                                        Text(
                                          "${transfer.id}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Gap(5),
                                Text(
                                  "To  ${transfer.to}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(44, 99, 139, 1)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Utility method to create a box for each piece of data
Widget _buildGreenBox(String text) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(76, 102, 43, 1), // Border color
        ),
        borderRadius: BorderRadius.circular(4), // Rounded corners
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Use min size of Row
        children: [
          SizedBox(width: 4), // Space between icon and text
          Text(text, style: TextStyle(color: Color.fromRGBO(76, 102, 43, 1))),
        ],
      ),
    );
