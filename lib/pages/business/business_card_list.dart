import 'package:flutter/material.dart';

class BusinessCardList extends StatefulWidget {
  @override
  _BusinessCardListState createState() => new _BusinessCardListState();
}

class _BusinessCardListState extends State<BusinessCardList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text(
            '名刺リスト',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600
            ),
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: ListView(
            children: List.generate(10, (index) {
              return InkWell(
                onTap: (){
                  // ここに画面遷移の処理を追加する
                },
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset("assets/images/smarting.png"),
                      Container(
                          margin: EdgeInsets.all(10.0),
                          child: ListTile(
                            title: Text("screen$index.jpg"),
                            leading: Icon(Icons.person),
                            subtitle: Text("サブタイトル"),
                          )),
                    ],
                  ),
                ),
              );
            })));
  }
}

class MyHomePageDetail extends StatefulWidget {
  @override
  _MyHomePageDetailState createState() => new _MyHomePageDetailState();
}

class _MyHomePageDetailState extends State<MyHomePageDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Material App"),
        ),
        body: Center(
          child: Text("画面遷移できました"),
        ));
  }
}