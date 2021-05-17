import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarting/model/data.dart';
import 'package:smarting/model/list.dart';
import 'package:smarting/widget/slidable_widget.dart';

class EquipmentManage extends StatefulWidget {
  @override
  _EquipmentManageState createState() => _EquipmentManageState();
}

class _EquipmentManageState extends State<EquipmentManage> {
  List<Data> items = List.of(ListJ.listData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            final item = items[index];

            //横スクロール機能呼び出し
            return SlidableWidget(
                child: buildListTile(item),
                onDismissed: (action) =>
                    dismissSlidableItem(context, index, action));
          },
        ),
        //備品追加ボタン
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('備品追加'),
          icon: Icon(Icons.add),
        ));
  }

  //リスト呼び出しウィジェット
  Widget buildListTile(Data item) {
    return ListTile(
      leading: IconButton(icon: Icon(Icons.error_outline), onPressed: () {}),
      title: Text(
        item.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(item.sub),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Text('${item.stock}'),
      )
    );
  }

  //横スライド時、削除機能
  void dismissSlidableItem(
      BuildContext context, int index, SlidableAction action) {
    setState(() {
      items.removeAt(index);
    });
  }
}
