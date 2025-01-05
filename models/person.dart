class Person {
  String name;
  int age;
  String dept;
  List<String> chat;
  String image;

  Person(
      {required this.name,
        required this.age,
        required this.dept,
        required this.chat,
        required this.image});

  void display() {
    print("Name: $name,age:$age,dept:$dept");
  }
}
