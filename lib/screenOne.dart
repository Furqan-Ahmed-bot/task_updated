// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';  
  
// ignore: use_key_in_widget_constructors
class FirstScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 14,
      itemBuilder: (index , builder) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10 , top: 20),
            child: Text('Title' , style: TextStyle(color: Colors.black , fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10 , top: 10),
            child: Container(
              height: 40,
             
              
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.' , style: TextStyle(fontSize: 16),),
              
        
            ),
          ),
          Center(
            child: Container(
              width: 360,
              child: Divider(color: Colors.black,)),
          )
        ],
      );
    });
  }  
}  