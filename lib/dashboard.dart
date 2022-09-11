// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';  

import 'screenOne.dart';
import 'screenTwo.dart';  
  
class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
    Widget build(BuildContext context) {  
    return MaterialApp(  
      home: DefaultTabController(  
        length: 2,  
        child: Scaffold(  
          drawer: Drawer(),
          appBar: AppBar(  
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.search , size: 30,),
              ), 
            ],
            title: Text('Flutter Tabs Demo'),  
            bottom: TabBar(  
              tabs: [  
                Tab(text: "ALL POSTS"),  
                Tab(text: "PROFILE")  
              ],  
            ),  
          ),  
          body: TabBarView(  
            children: [  
              FirstScreen(),  
              SecondScreen(),  
            ],  
          ),  
        ),  
      ),  
    );  
  }  

}  