import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarting/model/equipment_listdata.dart';
import 'package:smarting/pages/business/camera.dart';

class EquipmentDetailInfo extends StatefulWidget {
  // モデル指定
  final EquipmentConst item;

  // 受け取ったデータを格納
  const EquipmentDetailInfo({Key? key, required this.item}) : super(key: key);

  @override
  _EquipmentDetailInfoState createState() => _EquipmentDetailInfoState();
}

class _EquipmentDetailInfoState extends State<EquipmentDetailInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 臨時データ
    String _cate = widget.item.name;
    String _name = widget.item.sub;
    String _pic = widget.item.picture;
    int _stock = widget.item.stock;
    String _biko = widget.item.biko;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          '備品詳細情報',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 45,
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
              height: 45,
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
                child: Center(
                  child: Image.asset(_pic),
                ),
                height: 180,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CameraApp())),
            ),
            Container(
              height: 45,
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle)),
                  Flexible(
                      child: TextFormField(
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
                      labelText: '個数',
                      //errorText: 'Error message',
                      border: OutlineInputBorder(),
                      counterText: '',
                    ),
                  )),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add_circle))
                ],
              ),
              width: 220,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                maxLines: 2,
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
              height: 55,
              margin: EdgeInsets.fromLTRB(35.0, 15.0, 35.0, 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: CupertinoButton(
                      child: Text('初期化',
                          style: TextStyle(
                              letterSpacing: 8.0,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.orangeAccent.shade100,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: CupertinoButton(
                      child: Text('登録',
                          style: TextStyle(
                              letterSpacing: 8.0,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.orange,
                      onPressed: () {},
                    ),
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
