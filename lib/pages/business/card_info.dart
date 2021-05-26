import 'package:flutter/material.dart';

class cardInfo extends StatefulWidget{
  // final List<BusinessCardModel> itemData;
  //
  // const cardInfo({Key? key, required this.itemData}) : super(key: key);

  @override
  _cardInfo createState() => _cardInfo();
}

class _cardInfo extends State<cardInfo>{

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // onPressed: () => showAlertDialog(),
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close),
        ),
        title: Text("名刺追加"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '写真正面',
              textAlign: TextAlign.start,
            ),
            InkWell(
              child: Container(
                child: Image.asset(
                  'assets/images/smarting.png',
                  height: 200,
                ),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cardInfo())
              ),
            ),
            Text(
              '写真裏面',
              textAlign: TextAlign.right,
            ),
            InkWell(
              child: Container(
                child: Image.asset(
                  'assets/images/smarting.png',
                  height: 200,
                ),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cardInfo())
              ),
            ),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: '神津　里見',
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "お名前",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: '080-1234-5678',
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "TEL/FAX",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: 'スマートアイエンジー株式会社',
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "住所",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: '浅草橋駅',
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "最寄駅",
                ),
              ),
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
                  RaisedButton(
                      child: Text('保存しない'),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }
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