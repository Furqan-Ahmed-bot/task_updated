// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';  
  
// ignore: use_key_in_widget_constructors
class FirstScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Container(  
      child: Center(  
        child: Text('It is a contact tab, which is responsible for displaying the contacts stored in your mobile',  
            style: TextStyle(fontSize: 32.0),  
          )  
      ),  
    );  
  }  
}  