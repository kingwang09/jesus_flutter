import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: SnackBarExample(),
    )
  );
}

class SnackBarExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('앱바 예제입니다.'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('스넥바 예제입니다.')),
              );
            },
            child: Text(
              'Snackbar',
            ),
          ),
        ],
      ),
    );
  }
}
