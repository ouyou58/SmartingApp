import 'package:flutter/material.dart';
import 'package:smarting/model/card_list.dart';
import 'package:smarting/model/card.dart';

class BusinessCardList extends StatefulWidget {

  @override
  _BusinessCardListState createState() => new _BusinessCardListState();
}

class _BusinessCardListState extends State<BusinessCardList> {
  List<CardData> business = List.of(ListC.listData);

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
                  // Image.asset("assets/images/smarting.png"),
                  Image.asset('assets/images/'),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text('photo$index.png'),
                      leading: Icon(Icons.file_copy),
                      subtitle: Text('ddddd'),

                    )
                  ),
                  Image.asset('assets/images/sbi.png'),
                  Image.asset('assets/images/fujisoft.png'),
                ],
              ),
            ),
          );
        })
      )
    );
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