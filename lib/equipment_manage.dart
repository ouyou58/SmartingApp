import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarting/model/data.dart';
import 'package:smarting/model/list.dart';
import 'package:smarting/pages/equipment_info.dart';
import 'package:smarting/widget/slidable_widget.dart';

class EquipmentManage extends StatefulWidget {
  @override
  _EquipmentManageState createState() => _EquipmentManageState();
}

class _EquipmentManageState extends State<EquipmentManage> {
  List<Data> equipments = List.of(ListJ.listData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: equipments.length,
          itemBuilder: (context, index) {
            final equipmentList = equipments[index];
            //横スクロール機能呼び出し
            return SlidableWidget(
                child: buildEquipementList(equipmentList),
                onDismissed: (action) =>
                    dismissSlidableItem(context, index, action));
          },
          separatorBuilder: (context, index) => Divider(),
        ));
  }

  //リスト呼び出しウィジェット
  Widget buildEquipementList(Data item) {
      return Column(
        // 自定义cell
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.amber[100],
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child:Row(
              children: [
                Text("カテゴリー : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                Text(item.name, style: TextStyle(fontSize: 16),)
              ],
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Center(child:Image.asset(item.picture)),
              height: 300,
            ),
            onTap: () => Navigator.push(
                context,
                //item伝送
                MaterialPageRoute(builder: (context) => EquipmentInfo(item: item))
            ),
          ),
          Container(
              //color: Colors.amber[200],
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child:Row(
                children: [
                  Text("備品名 : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  Text(item.sub, style: TextStyle(fontSize: 16),)
                ],
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
          ),
          Container(
              //color: Colors.amber[100],
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child:Row(
                children: [
                  Text("個数 : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  Text('${item.stock}個', style: TextStyle(fontSize: 16),),
                ],
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
          ),
        ],
      );
  }

  //横スライド時、削除機能
  void dismissSlidableItem(
      BuildContext context, int index, SlidableAction action) {
    setState(() {
      equipments.removeAt(index);
    });
  }
}
