import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../pages/business/take_picture.dart';
import 'package:smarting/pages/business/camera_select.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);
  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  String? name = "入力してください。";
  String? phone = "入力してください。";
  String? address = "入力してください。";
  String? station = "入力してください。";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          '名刺追加',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600
          ),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  '名刺正面',
                  textAlign: TextAlign.start,
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
                      child: Icon(
                        Icons.photo_camera_outlined, size: 100,
                      ),
                    ),
                    //child: Center(child: Image.asset(pic!),),
                    height: 200,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraSelect())
                  ),
                ),
                Text(
                  '名刺裏面',
                  textAlign: TextAlign.start,
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
                      child: Icon(
                        Icons.photo_camera_outlined, size: 100,
                      ),
                    ),
                    //child: Center(child: Image.asset(pic!),),
                    height: 200,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraSelect())
                  ),
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
                Text(
                  "お名前　あなたの入力 : ${this.name}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  minLines: 1,
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
                        this.name = text;
                      });
                    }
                    else {
                      setState(() {
                        this.name = "入力してください。";
                      });
                    }
                  },
                ),
                Text(
                  "TEL/FAX　あなたの入力 : ${this.phone}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  minLines: 1,
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
                        this.phone = text;
                      });
                    }
                    else {
                      setState(() {
                        this.phone = "入力してください。";
                      });
                    }
                  },
                ),
                Text(
                  "住所　あなたの入力 : ${this.address}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  minLines: 1,
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
                        this.address = text;
                      });
                    }
                    else {
                      setState(() {
                        this.address = "入力してください。";
                      });
                    }
                  },
                ),
                Text(
                  "最寄駅　あなたの入力 : ${this.station}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  minLines: 1,
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
                        this.station = text;
                      });
                    }
                    else {
                      setState(() {
                        this.station = "入力してください。";
                      });
                    }
                  },
                ),
                CupertinoButton(
                  child: Text('保存'),
                  color: Colors.orange,
                  onPressed: () {
                    this.showAlertDialog();
                  },
                ),
              ],
            ),
        ),
      ),
    );
  }
  Widget myContainer({double size = 300,  String text = ''}) {
    return Container(
      // color: color,
      width: size,
      height: size,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
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
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Text('保存しない'),
                      color: Colors.orangeAccent.shade100,
                    onPressed: () {
                      Navigator.of(context).pop();
                    }
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Text('保存します'),
                    color: Colors.orange,
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
