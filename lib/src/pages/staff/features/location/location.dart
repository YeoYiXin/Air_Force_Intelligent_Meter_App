import 'package:flutter/material.dart';

class Location extends StatefulWidget{
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
      ),
    );
  }
}