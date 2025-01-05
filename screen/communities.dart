import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/User.dart';
import 'package:http/http.dart' as http;

import '../database/database.dart';
import '../models/User.dart';

class Communities extends StatefulWidget {
  const Communities({super.key});

  @override
  State<Communities> createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  List<User?> users = [];

  //wrie code to call get API using https://jsonplaceholder.typicode.com/users
  getUsersData() async {
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    print(response.body);
    print(response.body.runtimeType);
    users = [];
    dynamic decodedStringMap = jsonDecode(response.body);

    /* decodedStringMap.forEach((element){
      users.add(User.fromJson(element));
    });

    print(users);
    print(users[0]?.company?.name);
    print(decodedStringMap[0]['company']['name']);
    print(users[0]?.address?.geo?.lat);
    print(decodedStringMap[0]['address']['geo']['lat']);*/
    DatabaseHelper db = DatabaseHelper.instance;
    decodedStringMap.forEach((element) {
      db.insertUser(User.fromJson(element));
    });
    getUserDatafromLocalDB();
  }

  getUserDatafromLocalDB() {
    DatabaseHelper db = DatabaseHelper.instance;
    db.getAllUsers().then((value) {
      if (value != null && value.isNotEmpty) {
        users = value;
      } else {
        users = [];
        print("No data found");
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red.shade200,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(users[index]?.name ?? ""),
                  Text(users[index]?.email ?? ""),
                  Text(users[index]?.address?.city ?? ""),
                  Text(users[index]?.company?.name ?? ""),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
