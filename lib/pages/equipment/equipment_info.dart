import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarting/model/list.dart';
import 'package:smarting/pages/business/camera_select.dart';

class EquipmentInfo extends StatefulWidget{
  final Data item;

  const EquipmentInfo({Key? key, required this.item}) : super(key: key);

  @override
  _EquipmentInfoState createState() => _EquipmentInfoState();
}

class _EquipmentInfoState extends State<EquipmentInfo> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _cate = widget.item.name;
    String _name = widget.item.sub;
    String _pic = widget.item.picture;
    int _stock = widget.item.stock;
    String _biko = widget.item.biko;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          '備品管理',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: TextFormField(
                initialValue: _cate,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'カテゴリー',
                  //errorText: 'Error message',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                initialValue: _name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: '備品名',
                  //errorText: 'Error message',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Center(child: Image.asset(_pic),),
                height: 200,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraSelect())
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle)),
                  Flexible(child:
                  TextFormField(
                    textAlign: TextAlign.center,
                    inputFormatters: <TextInputFormatter>[
                      // ignore: deprecated_member_use
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    initialValue: '$_stock',
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: '在庫',
                      //errorText: 'Error message',
                      border: OutlineInputBorder(),
                      counterText: '',
                    ),
                  )
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add_circle))
                ],
              ),
              width: 180,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                maxLines: 5,
                initialValue: _biko,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: '備考',
                  //errorText: 'Error message',
                  border: OutlineInputBorder(),
                  counterText: '',
                  alignLabelWithHint: true,
                ),
                maxLength: 135,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CupertinoButton(
                    child: Text('初期化'),
                    color: Colors.orangeAccent.shade100,
                    onPressed: () {
                    },
                  ),
                  CupertinoButton(
                    child: Text('登録'),
                    color: Colors.orange,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
