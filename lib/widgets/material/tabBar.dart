
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyTabBarApp());
}

class MyTabBarApp extends StatelessWidget{
  const MyTabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TabBar Example",
      home: MyTabBarAppHome(),
    );
  }

}

class MyTabBarAppHome extends StatefulWidget{
  const MyTabBarAppHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabBarState();
  }
}

class _TabBarState extends State<MyTabBarAppHome> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);//this할 때 SingleTickerProviderStateMixin가 필요함.
    tabController.addListener(() {
      if(!tabController.indexIsChanging){
        print("이전 index, ${tabController.previousIndex}");
        print("현재 index, ${tabController.index}");
        print("전체 탭 길이, ${tabController.length}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBar AppBar임."),
      ),
      body: TabBarView(
        children: [
          Center(
            child: Text("첫번째 페이지임."),
          ),
          Center(
            child: Text("두번째 페이지임.."),
          )
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.accessible_forward),
            text: "첫째",
          ),
          Tab(
            icon: Icon(Icons.accessibility),
            text: "둘째",
          )
        ],
      ),
    );
  }

  @override
  void dispose() {//앱 끝날때 리소스 해제해줌 (controller)
    tabController.dispose();
    super.dispose();
  }

}