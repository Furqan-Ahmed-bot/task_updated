// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:job_task/providers.dart';
import 'package:provider/provider.dart';  
  
class SecondScreen extends StatefulWidget {  
    final name;
 
  final username;
  final address;

  const SecondScreen({Key? key, required this.name, required this.username, required this.address}) : super(key: key);
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override  
  Widget build(BuildContext context) {  
    UserPovider dataProvider =
            Provider.of<UserPovider>(context, listen: false);
    //  final user = Provider.of<UserPovider>(context).user;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Name' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.name , style: TextStyle(fontSize: 18),),
            ),
            

          ],
        ),

        Divider(color: Colors.black,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Userame' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.username , style: TextStyle(fontSize: 18),),
            ),
            

          ],
        ),
         Divider(color: Colors.black,),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Address' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                child: Text('${widget.address['street']} , ${widget.address['suite']} , ${widget.address['city']}'  , style: TextStyle(fontSize: 18 ),)),
            ),
            

          ],
        ),
         Divider(color: Colors.black,),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('zipCode' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.address['zipcode']}'  , style: TextStyle(fontSize: 18 ),),
            ),
            

          ],
        ),
        Divider(color: Colors.black,),
       
        
      ],

     
    );  
  }  
}