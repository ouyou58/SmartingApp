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
      body: Center(child: Text("gfffff")),
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
                  FlatButton(
                    child: Text('保存しない'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SmartingApp()));
                    },
                  ),
                  FlatButton(
                    child: Text('保存します'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              )
            ],
          );
        });
    // Navigator.pop(this.context);
  }
}
