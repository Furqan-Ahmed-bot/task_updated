import 'dart:convert';

class User {
  final String user_id;
  final String name;
  final String username;
  final String email;

  final String address;
  
  

  User({
    required this.user_id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    
    
  });


  Map<String, dynamic> toMap() {
    return {
      'id' : user_id,
      'name' : name,
      'username' : username,
      'email' : email,
      'address' : address,



    };
  }

  factory User.fromMap(Map<String, dynamic> map){
    return User(
    user_id: map['user_id'], 
    name: map['name'],
    username: map['username'], 
    email: map['email'], 
    address: map['address'], 

    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));



}