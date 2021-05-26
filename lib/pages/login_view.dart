import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/pages/smarting_main.dart';
import 'package:smarting/provider/page_notifier.dart';

class LoginView extends StatefulWidget {
  static final String pageName = 'LoginView';

  LoginView({Key? key,  required this.title}) : super(key: key);

  final String title;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool isSignUp = true;

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
            Padding(
              padding: EdgeInsets.all(45),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        ButtonBar(
                          children: [
                            // ignore: deprecated_member_use
                            FlatButton(
                                onPressed: (){
                                  setState(() {
                                    isSignUp = false;
                                  });
                                },
                                child: Text(
                                  'ログイン',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: isSignUp?FontWeight.w300:FontWeight.w600,
                                      color: isSignUp?Colors.orange.shade300:Colors.orange.shade800,
                                  ),
                                )
                            ),
                            // ignore: deprecated_member_use
                            FlatButton(
                                onPressed: (){
                                  setState(() {
                                    isSignUp = true;
                                  });
                                },
                                child: Text(
                                  '新規登録',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: isSignUp?FontWeight.w600:FontWeight.w300,
                                      color: isSignUp?Colors.orange.shade800:Colors.orange.shade300,
                                  ),
                                )
                            )
                          ],
                        ),
                      ],
                    )
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
                          height: 50,
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
                        AnimatedContainer(
                          height: isSignUp?0:50,
                          duration: Duration(milliseconds: 100),
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
                                child: Text(isSignUp?'新規登録':'ログイン', style: TextStyle(color: Colors.white),),
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
