// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';  
  
class SecondScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Container(  
      child: Center(  
        child: Text('It is a second layout tab, which is responsible for taking pictures from your mobile.',  
        style: TextStyle(fontSize: 35.0),  
        ),  
      ),  
    );  
  }  
}