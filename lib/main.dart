import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarting/business_name.dart';
import 'package:smarting/equipment_manage.dart';

void main() => runApp(SmartingApp());

class SmartingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomNavigationController(),
      ),
    );
  }
}

class BottomNavigationController extends StatefulWidget {
  @override
  _BottomNavigationControllerState createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  int _currentIndex = 0;
  final pages = [EquipmentManage(),BusinessName()];
  // タブバー feshfekhっっdjっっっっっっfee
  final tabBarTitle = ['備品管理', '名刺管理'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('スマートアイエンジー',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight:FontWeight.w600),),
      ),
      drawer: Drawer(child: ListView(),),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment), label: tabBarTitle[0]),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: tabBarTitle[1])
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.amber,
        onTap: (value) {
          setState(() {
            this._currentIndex = value.toInt();
          });
        },
      ),
    );
  }
}
