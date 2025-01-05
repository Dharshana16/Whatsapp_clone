import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/person.dart';

/*class Calls extends StatelessWidget {
  const Calls({
    super.key,
    required this.student1,
  });

  final Person? student1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(alignment: Alignment.center, children: [
        Container(
          alignment: Alignment.center,
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.red.shade200,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
        Positioned(
          top: 25,
          left: 25,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red.shade400,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: Text("${student1?.name ?? 'aa'}"),
          ),
        ),
      ]),
    );
  }
}*/
class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Calls",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
