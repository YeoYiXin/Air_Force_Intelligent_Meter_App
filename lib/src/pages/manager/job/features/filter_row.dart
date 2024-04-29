import 'package:flutter/material.dart';

class FilterRow extends StatefulWidget {
  const FilterRow({super.key});

  @override
  State<FilterRow> createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  List<String> filters = [
    'Pick up from region store',
    'Bringing to meter lab',
    'Meter inspection',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          return Container(
            margin: EdgeInsets.only(right: 10),
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(247, 249, 255, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                filters[index],
                style: TextStyle(
                  color: Color.fromRGBO(14, 102, 129, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        )
    );
  }
}