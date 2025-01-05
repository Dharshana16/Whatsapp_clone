import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/person.dart';
import 'chat_screen.dart';

class Chats extends StatefulWidget {
  Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<Person> person = [
    Person(
        name: "Oggy",
        age: 18,
        dept: "AMCS",
        chat: ["zuzoizuzoi-zuzoizuzoi"],
        image:
        "https://i.pinimg.com/474x/10/55/71/1055714a9f5b283a94a03655032a0287.jpg"),
    Person(
        name: "Tommy",
        age: 18,
        dept: "AMCS",
        chat: ["Where's my jerrieee!?"],
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGDKSgezKpS-uZSWb_PGkKHSzoV_5W8SiYyA&s"),
    Person(
        name: "Nammadhan",
        age: 18,
        dept: "AMCS",
        chat: ["Paathuklam"],
        image:
        "https://i.pinimg.com/736x/38/02/93/3802939c55b8c6f1a96f67dc50a4a6c9.jpg"),
    Person(
        name: "Yaara Andha Payyan",
        age: 18,
        dept: "AMCS",
        chat: ["Naandha andha Payan"],
        image:
        "https://images.coplusk.net/project_images/208626/image/2019-11-27-210127-burger.jpg"),
    Person(
        name: "kaipulla",
        age: 18,
        dept: "AMCS",
        chat: ["Innum Enda Mulichutu iruka!?", "Thoongu"],
        image:
        "https://mir-s3-cdn-cf.behance.net/projects/404/7cb9c682303763.Y3JvcCwxMDU3LDgyNyw1NCww.jpg"),
    Person(
        name: "oru cow",
        age: 18,
        dept: "AMCS",
        chat: ["Adhaavadhu oru Maadu", "If am not wrong", "Scientifically"],
        image:
        "https://static.vecteezy.com/system/resources/previews/016/746/931/non_2x/doodle-of-head-cute-cow-isolated-on-white-background-hand-drawn-illustration-of-farm-animal-face-good-for-kids-design-and-coloring-page-book-vector.jpg"),
    Person(
        name: "Og",
        age: 18,
        dept: "AMCS",
        chat: ["Oh mY Gawd"],
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFzdsGWXvfjp7-TTYA888Kl3BBQJUZhgobXA&s"),
    Person(
        name: "kadavuley ajitheey",
        age: 18,
        dept: "AMCS",
        chat: ["never ever give up!"],
        image:
        "https://preview.redd.it/ajith-eh-v0-3qipzdqwjshd1.jpeg?width=2229&format=pjpg&auto=webp&s=5a44aa5c145c8a2b28119e863fd1c096006ebdb5"),
    Person(
        name: "Ambaani",
        age: 18,
        dept: "AMCS",
        chat: ["Money Money Money!!"],
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfEGrvY5j2MdqGz7jXG_g8XkUAGH7haVSYkQ&s"),
    Person(
        name: "Nemoo",
        age: 18,
        dept: "AMCS",
        chat: ["Are you gonna swim or sink?"],
        image:
        "https://i.pinimg.com/564x/e3/e5/dc/e3e5dc4143d77b3dcea61776d372928c.jpg"),
  ];

  TextEditingController controller = TextEditingController();

  String _class = "Fluttter";

  List<Person> filteredList=[];


  @override
  void initState() {
    super.initState();
    filteredList=person;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              onChanged:(value) {
                if (value.isNotEmpty) {
                  filteredList = person
                      .where((element) =>
                      element.name.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                } else {
                  filteredList = person;
                }
                setState(() {});
              },
              keyboardType: TextInputType.text,
              //obscureText: true,
              //obscuringCharacter: "*",
              focusNode: FocusNode(),
              decoration: InputDecoration(
                hintText: "Type a Message",
                suffixIcon: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          controller.text,
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.red.shade50,
                      ));
                    },
                    child: Icon(Icons.send)),
                prefixIcon: Icon(Icons.search),
              ),
              controller: controller,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChatScreen(person: filteredList[index])));
                    },
                    child: ListTile(
                      title: Text(filteredList[index].name),
                      subtitle: Text(filteredList[index].chat[0]),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(filteredList[index].image)),
                      trailing: Text("10:00"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}