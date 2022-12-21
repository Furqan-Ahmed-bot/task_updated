// ignore_for_file: prefer_const_constructors, prefer_final_fields, non_constant_identifier_names, use_key_in_widget_constructors, must_call_super, sized_box_for_whitespace, deprecated_member_use, duplicate_ignore, unused_local_variable, avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'Dashboard.dart';
import 'models.dart';
import 'providers.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // String? token1;
  // bool ShowCircle = true;
  // bool isloading = false;
  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void initState() {}

  @override
  // static String p =
  //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  // static RegExp regExp = new RegExp(p);
  Future<void> vaildation() async {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Both Fleid Is Empty"),
        ),
      );
    } else if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
    } else {
      LoginUser();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Image(
                    height: 200,
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.grey[800]),
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[280],
                              filled: true,
                              //  suffixIcon: Padding(
                              //   padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                              //   child: Icon(
                              //     Icons.remove_red_eye,
                              //   ),
                              // ),
                              hintText: ('Email'),
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(00),
                                borderSide: BorderSide.none,
                              )),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        TextFormField(
                          style: TextStyle(color: Colors.grey[800]),
                          controller: passwordController,
                          obscureText: false,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[280],
                              filled: true,
                              suffixIcon: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                                child: Icon(
                                  Icons.remove_red_eye,
                                ),
                              ),
                              hintText: ('Password'),
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(00),
                                borderSide: BorderSide.none,
                              )),
                        ),
                        // TextFormField(
                        //   controller: passwordController,
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //       labelText: "Password",
                        //       hintText: "Enter Your Password",
                        //       floatingLabelBehavior:
                        //           FloatingLabelBehavior.always,
                        //       suffixIcon: Padding(
                        //         padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                        //         child: Icon(
                        //           Icons.password,
                        //         ),
                        //       ),
                        //       contentPadding: EdgeInsets.symmetric(
                        //           horizontal: 42, vertical: 20),
                        //       enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(28),
                        //           borderSide: BorderSide(color: Colors.black),
                        //           gapPadding: 10),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(28),
                        //         borderSide: BorderSide(color: Colors.black),
                        //         gapPadding: 10,
                        //       )),
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFE43228),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),

                      // color: Color(0xFFE43228),
                      // ignore: prefer_const_constructors
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        vaildation();
                        // LoginUser();
                        // vaildation().then((_) {
                        //   LoginUser().whenComplete(() {
                        //     setState(() {
                        //       isloading=false;
                        //     });
                        //   });
                        // });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future LoginUser() async {
    int flag = 0;
    var result =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var msg = jsonDecode(result.body);
    print(result);
    if (result.statusCode == 200) {
      var res = result.body;
      dynamic data = json.decode(res);
      print(result.body);

      if (msg.length <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Incorrect Email or Password!')));
      } else {
        UserPovider dataProvider =
            Provider.of<UserPovider>(context, listen: false);

        dataProvider.setRolesData(data);
        print('This is ${dataProvider.rolesData}');

        for (var i = 0; i <  dataProvider.rolesData.length; i++) {
          if(emailController.text == dataProvider.rolesData[i]['email'] && passwordController.text == dataProvider.rolesData[i]['username']){
               Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Dashboard(

          dataProvider.rolesData[i]['name'],
          dataProvider.rolesData[i]['username'],        
          dataProvider.rolesData[i]['address'],

          ),
        ));
          break;
          }
          else{
            print('Nooo User Found');
          }
          
        }
        print(
         'Email is ${ dataProvider.rolesData[0]['email']}'
        );

      

        // else{
        //   print('Incorrect USer');
        // }

      }
    } else {
      print('No User Found');
    }
  }
}
