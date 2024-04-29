import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainSearch extends StatefulWidget {
  const MainSearch({Key? key}) : super(key: key);

  @override
  _MainSearchState createState() => _MainSearchState();
}

class _MainSearchState extends State<MainSearch> {
  final TextEditingController _searchController = TextEditingController();
  bool isFocused = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              setState(() {
                isFocused = true;
              });
            },
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: isFocused
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
                      )
                    : InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/icons/Profile_nav.png", width: 25, height: 25),
                ),
              ),
            ),
          ),
          leading: IconButton(
            icon: Image.asset("assets/icons/Previous.png", width: 25, height: 25),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Image.asset("assets/icons/Bell_black.png", width: 25, height: 25),
              onPressed: () {
                // Define what to do when bell icon is pressed
              },
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text("hello"),
              ),
              Gap(10), // Adjust as necessary
            ],
          ),
        ),
      ),
    );
  }
}
