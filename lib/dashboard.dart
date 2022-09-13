// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';  

import 'screenOne.dart';
import 'screenTwo.dart';  
  
class Dashboard extends StatefulWidget {
  
  final name;
 
  final username;
  final address;


   Dashboard(   this.name,  this.username,  this.address );

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
          drawer: Drawer(
          
          ),
          appBar: AppBar(  
            backgroundColor: Color(0xFFE43228),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.search , size: 30,),
              ), 
            ],
            title: Text('Lorem Lpsum'),  
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
              SecondScreen(name: widget.name , username:  widget.username, address: widget.address,),  
            ],  
          ), floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFFE43228),
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
//       ), 
          
        ),  
      ),  
    ));  
  }  

}  