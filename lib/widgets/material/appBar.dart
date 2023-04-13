
//appBar
//구성요소
//- leading
//- title
//- actions
//- body
//- bottom
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyAppBar());
}

class MyAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Appbar Demo...'),
          actions: [
            IconButton(
                icon: Icon(Icons.add_alarm),
                onPressed: (){
                  ScaffoldMessenger
                      .of(context)
                      .showSnackBar(const SnackBar(content: Text('This is a snackbar')));
                },
            ),
            IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context){
                          return Scaffold(
                            appBar: AppBar(
                              title: Text("next Page: 다음 페이집니다."),
                            ),
                            body: Center(
                              child: Text("두번째 페이집니다...."),
                            ),
                          );
                        }
                      )
                  );
                },
            )
          ],
        ),
        body: Center(
          child: Text(
            "이것이 첫 페이지 입니다..."
          ),
        ),
      ),
    );
  }

}