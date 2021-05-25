import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(

        ),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 45),
              color: Colors.orange.shade200,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/smt_logo2.png'),
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(Colors.orange.shade200, BlendMode.dstATop)
                        )
                    ),
                  ),
                  Text(
                    'スマートアイエンジー株式会社',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/beer.jpg'),
                          fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    '○○○○○○＠smarting.jp',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                  Text(
                    'Flutter開発部 メンバー',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                  Text(
                    '丸井 丸丸',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                '個人情報'
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                '設定'
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                  '個人情報'
              ),
            )
          ],
        ),
    );
  }


}