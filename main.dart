import 'package:flutter/material.dart';
import 'package:flutter_project/screen/call.dart';
import 'package:flutter_project/screen/chats.dart';
import 'package:flutter_project/screen/communities.dart';
import 'package:flutter_project/screen/updates.dart';
import 'models/person.dart';
//https://jsonplaceholder.typicode.com/users
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade100),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Whatsapp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int year = 2025;
  String name = "Dee";
  String dept = "AMCS";
  Person? student1;
  int currentIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    print("Init State");
    student1 =
        Person(name: "dharshana", age: 20, dept: "AMCS", chat: [], image: "");
    print(student1?.name);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Whatsapp"),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          Home(),
          Chats(),
          Updates(),
          Communities(),
          Calls(),//Calls(student1: student1),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            student1 = Person(
                name: "Daisy", age: 25, dept: "AMCS", chat: [], image: "");
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add_photo_alternate_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Home",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.red),
          ),
        ),
      ),
    );
  }
}





