import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stubbbb/HomePage/MyHomePage.dart';
import 'package:stubbbb/HomePage/MyMessagePage.dart';
import 'package:stubbbb/HomePage/MyProfilePage.dart';
import 'package:stubbbb/HomePage/MyRequestPage.dart';

import '../R.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;
  List<Widget> listwidget = [
    MyHomePage(),
    MyMessagePage(),
    MyRequestPage(),
  ];

  changePage(int indexpage) {
    setState(() {
      currentindex = indexpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(actions: <Widget>[
        new IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {})
      ], elevation: 0.0, backgroundColor: Color(0xff2c003e)),
      drawer: DrawerLists(),
      backgroundColor: Color(0xfff2f3f8),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16.0,
        iconSize: 26.0,
        selectedItemColor: R.color.banafshmain,
        showSelectedLabels: true,
        unselectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              title: new Text('خانه',)),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: new Text('چت',)),
          BottomNavigationBarItem(
              icon: Icon(Icons.markunread),
              title: new Text('جعبه',)),
        ],
        onTap: changePage,
        backgroundColor: Colors.white,
        currentIndex: currentindex,
      ),
      body: listwidget[currentindex],
    );
  }
}

class DrawerLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
//          padding: EdgeInsets.zero,
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: new DrawerHeader(
                child: new CircleAvatar(
              child: Image.asset('assets/image/download (4).png'),
            )),
          ),
          new Column(
            children: <Widget>[
              new Column(
                children: new List.generate(7, (int index) {
                  return listdrawer[index];
                }),
              )
            ],
          )
        ],
      ),
    );
  }
}

List<ListTile> listdrawer = [
  ListTile(
    leading: new Icon(Icons.person),
    onTap: () {},
    title: Text('پروفایل'),
    trailing: Icon(Icons.arrow_forward),
  ),
  ListTile(
    leading: new Icon(Icons.school),
    onTap: () {},
    title: Text('دانشجوهخا'),
    trailing: Icon(Icons.arrow_forward),
  ),
  ListTile(
    leading: new Icon(Icons.create_new_folder),
    onTap: () {},
    title: Text('آگهیا'),
    trailing: Icon(Icons.arrow_forward),
  ),
  ListTile(
    leading: new Icon(Icons.work),
    onTap: () {},
    title: Text('کارآموزی'),
    trailing: Icon(Icons.arrow_forward),
  ),
  ListTile(
    leading: new Icon(Icons.block),
    onTap: () {},
    title: Text('دانشجوی حرفه ای'),
    trailing: Icon(Icons.arrow_forward),
  ),
  ListTile(
    leading: new Icon(Icons.settings),
    onTap: () {},
    title: Text('تنظیمات'),
    trailing: Icon(Icons.arrow_forward),
  ),
  ListTile(
    leading: new Icon(Icons.exit_to_app),
    onTap: () {},
    title: Text('خروج'),
    trailing: Icon(Icons.arrow_forward),
  ),
];
