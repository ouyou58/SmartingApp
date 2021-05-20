import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarting/model/list.dart';

class EquipmentInfo extends StatefulWidget{
  final Data item;

  const EquipmentInfo({Key? key, required this.item}) : super(key: key);

  @override
  _EquipmentInfoState createState() => _EquipmentInfoState();
}

class _EquipmentInfoState extends State<EquipmentInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          '備品管理',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: TextFormField(
              initialValue: widget.item.name,
              decoration: InputDecoration(
                labelText: 'カテゴリー',
                //errorText: 'Error message',
                border: OutlineInputBorder(),
              ),
            ),
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              initialValue: widget.item.sub,
              decoration: InputDecoration(
                labelText: '備品名',
                //errorText: 'Error message',
                border: OutlineInputBorder(),
              ),
            ),
            color: Colors.white,
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Center(child: Image.asset(widget.item.picture),),
              height: 200,
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
            onTap: () {},
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              initialValue: '${widget.item.stock}',
              decoration: InputDecoration(
                  labelText: '在庫',
                  //errorText: 'Error message',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(left: 15)
              ),
            ),
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              maxLines: 5,
              initialValue: '${widget.item.biko}',
              decoration: InputDecoration(
                labelText: '備考',
                //errorText: 'Error message',
                border: OutlineInputBorder(),
                counterText: '',
              ),
              maxLength: 135,
            ),
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CupertinoButton(
                  child: Text('button'),
                  color: Colors.black26,
                  onPressed: () {},
                ),
                CupertinoButton(
                    child: Text('button'),
                    color: Colors.red[300],
                    onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
