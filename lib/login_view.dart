import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/smarting_AppMenu.dart';
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
      resizeToAvoidBottomInset : false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bglogin.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.orangeAccent, BlendMode.color)
          )
        ),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.orange.shade300,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color : Color.fromRGBO(255, 153, 0, 10),
                          blurRadius: 20.0,
                          offset: Offset(0, 10)
                      )
                    ]
                )
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(45),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(2),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color : Color.fromRGBO(255, 153, 0, 10),
                              blurRadius: 20.0,
                              offset: Offset(0, 10)
                          )
                        ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(2),
                            child: Center(child:Image.asset('assets/images/smt_logo2.png')),
                            decoration: BoxDecoration(
                                color: Colors.orange.shade200,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color : Color.fromRGBO(255, 153, 0, 10),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10)
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.orange.shade50
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "メールを入力してください。",
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.orange.shade50
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "パスワードを入力してください。",
                                hintStyle: TextStyle(color: Colors.grey[500])
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 120),
                                color: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Text('ログイン', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Provider.of<PageNotifier>(context, listen: false).goToOtherPage(SmartingAppMenu.pageName);
                                }
                            ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}
