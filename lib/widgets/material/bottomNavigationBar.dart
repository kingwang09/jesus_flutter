import 'package:flutter/material.dart';

void main(){
  runApp(const MyBottomNavigationBarApp());
}

class MyBottomNavigationBarApp extends StatelessWidget{
  const MyBottomNavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Bottom Navigation bar example",
      home: MyBottomNavigationBarAppHome()
    );
  }

}

class MyBottomNavigationBarAppHome extends StatefulWidget {
  const MyBottomNavigationBarAppHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyBottomNavigationBarAppState();
  }
}

class _MyBottomNavigationBarAppState extends State<MyBottomNavigationBarAppHome>{

  int _selected = 0;
  final List<Widget> _widgets = [
    const Text("첫번째 항목"),
    const Text("두번째 항목"),
    const Text("세번째 항목"),
  ];

  void _onSelected(int index){
    print("on selected: $index");
    setState(() {
      _selected = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation Example"),
      ),
      body: _widgets.elementAt(_selected),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: "Navi-1"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: "Navi-2"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alarm),
              label: "Navi-3"
          ),
        ],
        onTap: _onSelected,
        currentIndex: _selected,
      ),
    );
  }

}