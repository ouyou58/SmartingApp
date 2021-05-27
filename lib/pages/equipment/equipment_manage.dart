import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarting/model/data.dart';
import 'package:smarting/model/list.dart';

import 'package:smarting/widget/slidable_widget.dart';

import 'equipment_info.dart';

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
                    dismissSlidableItem(context, index, action)
            );
          },
          separatorBuilder: (context, index) => Divider(),
        )
    );
  }

  //リスト呼び出しウィジェット
  Widget buildEquipementList(Data item) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget> [
                SizedBox(height: 15),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent.shade200,
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                            color : Color.fromRGBO(255, 204, 51, 5),
                            blurRadius: 15.0,
                            offset: Offset(0, 8)
                        )
                      ]
                  ),
                  child: Row(
                    children: [
                      Text(' ● ${item.name}', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  child: Container(
                    height: 275,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item.picture),
                        fit: BoxFit.fitHeight
                      ),
                      color: Colors.grey.shade50,
                      boxShadow: [
                        BoxShadow(
                            color : Color.fromRGBO(255, 204, 51, 5),
                            blurRadius: 10.0,
                            offset: Offset(0, 10)
                        )
                      ]
                    ),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      //item伝送
                      MaterialPageRoute(builder: (context) => EquipmentInfo(item: item))
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent.shade100,
                      borderRadius: BorderRadius.circular(1),
                      boxShadow: [
                        BoxShadow(
                            color : Color.fromRGBO(255, 153, 0, 10),
                            blurRadius: 5.0,
                            offset: Offset(0, 2)
                        )
                      ]
                  ),
                  child:Row(
                    children: [
                      Text("・ 備品名  :  ",style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w600)),
                      Text(item.sub, style: TextStyle(color: Colors.black54, fontSize: 16),)
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent.shade100,
                      borderRadius: BorderRadius.circular(1),
                      boxShadow: [
                        BoxShadow(
                            color : Color.fromRGBO(255, 153, 0, 10),
                            blurRadius: 10.0,
                            offset: Offset(0, 5)
                        )
                      ]
                  ),
                  child:Row(
                    children: [
                       Text("・ 個数  :  ",style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w600)),
                       Text('${item.stock}個', style: TextStyle(color: Colors.black54, fontSize: 16)),
                    ],
                  ),
                ),
                SizedBox(height: 15)
              ],
            )
          )
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
