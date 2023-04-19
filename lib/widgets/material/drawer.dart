import 'package:flutter/material.dart';

void main(){
  runApp(const MyDrawerApp());
}

class MyDrawerApp extends StatelessWidget{
  const MyDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Bottom Navigation bar example",
      home: MyDrawerAppHome()
    );
  }

}

class MyDrawerAppHome extends StatelessWidget {
  const MyDrawerAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Drawer Demo'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
    );
  }
}