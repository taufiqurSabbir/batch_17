import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class Module10Class1 extends StatefulWidget {
  const Module10Class1({super.key});

  @override
  State<Module10Class1> createState() => _Module10Class1State();
}

class _Module10Class1State extends State<Module10Class1> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  
  List user =[];


  Future<void>getUser() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users')
    );

    if(response.statusCode == 200){
      setState(() {
        user = jsonDecode(response.body);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context,index){
        return Card(
          child: ListTile(
            title: Text(user[index]['name']),
            subtitle: Text(user[index]['email']),
            leading: CircleAvatar(
              child: Text(user[index]['name'][0]),
            ),
            
          ),
        );
      }),
    );
  }
}
