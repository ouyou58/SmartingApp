import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smarting/business_name.dart';

import 'main.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);
  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  String? inputedValueName = "入力してください。";
  String? inputedValueTel = "入力してください。";
  String? inputedValueAddress = "入力してください。";
  String? inputedValueStation = "入力してください。";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => showAlertDialog(),
          icon: Icon(Icons.close),
        ),
        title: Text("名刺追加"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Text(
                  '名刺の写真を撮ってください',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Text(
                '写真正面',
                textAlign: TextAlign.start,
              ),
              // RaisedButton(
              //   child: Text('保存します'),
              //   IconButton(
              //     icon: const Icon(Icons.camera_alt_outlined),
              //     iconSize: 100,
              //     color: Colors.black,
              //     onPressed: () {},
              //   ),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
              IconButton(
                icon: const Icon(Icons.camera_alt_outlined),
                iconSize: 100,
                color: Colors.black,
                onPressed: () {},
              ),
              Text(
                '写真裏面',
                textAlign: TextAlign.right,
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt_outlined),
                iconSize: 100,
                color: Colors.black,
                onPressed: () {},
              ),
              // Layout
              const Divider(
                height: 20,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),

              Container(
                width: double.infinity,
                child: Text(
                  '名刺の情報を入力してください',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),

              Text(''),

              // TextField(
              //   decoration: InputDecoration(
              //       // border: InputBorder.none,
              //       border: OutlineInputBorder(),
              //       labelText: "お名前",
              //       hintText: 'お名前を入力してください！'
              //   ),
              //   autofocus: true,
              // ),
              Text("お名前　あなたの入力 : ${this.inputedValueName}"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "お名前",
                  hintText: "お名前を入力してください！",
                ),

                // 変更を即時反映する。
                onChanged: (text) {
                  if (text.length > 0) {
                    // 入力値があるなら、それを反映する。
                    setState(() {
                      this.inputedValueName = text;
                    });
                  }
                  else {
                    setState(() {
                      this.inputedValueName = "入力してください。";
                    });
                  }
                },
              ),
              Text(''),
              Text("TEL/FAX　あなたの入力 : ${this.inputedValueTel}"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "TEL/FAX",
                  hintText: "TEL/FAXを入力してください！",
                ),

                // 変更を即時反映する。
                onChanged: (text) {
                  if (text.length > 0) {
                    // 入力値があるなら、それを反映する。
                    setState(() {
                      this.inputedValueTel = text;
                    });
                  }
                  else {
                    setState(() {
                      this.inputedValueTel = "入力してください。";
                    });
                  }
                },
              ),
              Text(''),
              Text("住所　あなたの入力 : ${this.inputedValueAddress}"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "住所",
                  hintText: "住所を入力してください！",
                ),

                // 変更を即時反映する。
                onChanged: (text) {
                  if (text.length > 0) {
                    // 入力値があるなら、それを反映する。
                    setState(() {
                      this.inputedValueAddress = text;
                    });
                  }
                  else {
                    setState(() {
                      this.inputedValueAddress = "入力してください。";
                    });
                  }
                },
              ),
              Text(''),
              Text("最寄駅　あなたの入力 : ${this.inputedValueStation}"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "最寄駅",
                  hintText: "駅名を入力してください！",
                ),

                // 変更を即時反映する。
                onChanged: (text) {
                  if (text.length > 0) {
                    // 入力値があるなら、それを反映する。
                    setState(() {
                      this.inputedValueStation = text;
                    });
                  }
                  else {
                    setState(() {
                      this.inputedValueStation = "入力してください。";
                    });
                  }
                },
              ),

              RaisedButton(
                child: Text('保存'),
                onPressed: () {
                  this.showAlertDialog();
                },
              ),
            ],
          ),
      ),
    );
  }

  showAlertDialog() {
    print("show dialog");
    showDialog<Null>(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text(
              "保存しますか？",
              style: TextStyle(fontSize: 15),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text('保存しない'),
                    color: Colors.red,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SmartingApp()));
                    },
                  ),
                  RaisedButton(
                    child: Text('保存します'),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        });
    // Navigator.pop(this.context);
  }
}
