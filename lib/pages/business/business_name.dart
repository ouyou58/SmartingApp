import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarting/model/business_card_model.dart';
import 'package:smarting/pages/business/card_info.dart';

class BusinessName extends StatelessWidget {
  //　TODO データベースから取得情報

  List<BusinessCardModel> itemData = [
    BusinessCardModel(
        businessCard: 'assets/images/smarting.png',
        companyName: 'スマートアイエンジー株式会社',
        name: '神津　里見'),
    BusinessCardModel(
        businessCard: 'assets/images/sbi.png',
        companyName: 'SBI株式会社',
        name: '石原　さとみ'),
    BusinessCardModel(
        businessCard: 'assets/images/fujisoft.png',
        companyName: '富士ソフト株式会社',
        name: '松本　大樹')
  ];

  @override
  Widget build(BuildContext context) {
    if (itemData == 0) {
      return Center(child: Text("there is nothing"));
    } else {
      return ListView.builder(
          itemCount: itemData.length,
          itemBuilder: (context, index) {
            return CardItem(
              index: index,itemData: itemData,
            );
          });
    }
  }
}

// 名刺リストitem
class CardItem extends StatelessWidget {
  final int index;
  final List<BusinessCardModel> itemData;

  const CardItem(
      {required this.index,required this.itemData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(child: Image.asset(itemData[index].businessCard)),
          onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => cardInfo())
          ),
        ),
        Container(
          child: Row(
            children: [Text('会社：'), Text(itemData[index].companyName)],
          ),
        ),
        Container(
          child: Row(
            children: [Text('名前:'), Text(itemData[index].name)],
          ),
        )
      ],
    );
  }
}
