import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/Smarting_AppMenu.dart';
import 'package:smarting/provider/page_notifier.dart';

class LoginView extends StatefulWidget {
  static final String pageName = 'LoginView';

  LoginView({Key? key,  required this.title}) : super(key: key);

  final String title;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: (){})
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'ID',
                  border: OutlineInputBorder(),
                ),
              ),
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'PW',
                  border: OutlineInputBorder(),
                ),
              ),
              color: Colors.white,
            ),
            RaisedButton(
              child: Text('ログイン'),
              onPressed: () {
                Provider.of<PageNotifier>(context, listen: false).goToOtherPage(SmartingAppMenu.pageName);
              }
            )
          ],
        ),
      ),
    );
  }
}
