import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarting/add_new_card.dart';
import 'package:smarting/add_new_equipment.dart';
import 'package:smarting/business_name.dart';
import 'package:smarting/equipment_manage.dart';

void main() => runApp(SmartingApp());

class SmartingApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上のdebug削除
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
  int currentIndex = 0;
  final pages = [EquipmentManage(), BusinessName()];

  // タブバー
  final tabBarTitles = ['備品管理', '名刺管理'];
  String currentTitle = "";

  @override
  Widget build(BuildContext context) {
    currentTitle = tabBarTitles[currentIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          currentTitle,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      drawer: Drawer(
        child: ListView(),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment), label: tabBarTitles[0]),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: tabBarTitles[1])
        ],
        currentIndex: currentIndex,
        fixedColor: Colors.amber,
        onTap: (value) {
          setState(() {
            this.currentIndex = value.toInt();
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddPage(),
        child: new Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showAddPage() {
    if (currentIndex == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddNewEquipment()));
    }else if (currentIndex == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddNewCard()));
    }
  }
}
