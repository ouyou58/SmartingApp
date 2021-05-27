import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/pages/smarting_main.dart';
import 'package:smarting/provider/page_notifier.dart';

class LoginView extends StatefulWidget {
  static final String pageName = 'LoginView';

  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  static bool _isSignUp = false;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailtextcontroller = TextEditingController();
  TextEditingController _passwordtextcontroller = TextEditingController();

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
                                    _isSignUp = false;
                                    _formKey.currentState!.reset();
                                  });
                                },
                                child: Text(
                                  'ログイン',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: _isSignUp?FontWeight.w300:FontWeight.w600,
                                      color: _isSignUp?Colors.orange.shade300:Colors.orange.shade800,
                                  ),
                                )
                            ),
                            // ignore: deprecated_member_use
                            FlatButton(
                                onPressed: (){
                                  setState(() {
                                    _isSignUp = true;
                                    _formKey.currentState!.reset();
                                  });
                                },
                                child: Text(
                                  '新規登録',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: _isSignUp?FontWeight.w600:FontWeight.w300,
                                      color: _isSignUp?Colors.orange.shade800:Colors.orange.shade300,
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 60,
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
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.orange.shade50
                            ),
                            child: buildTextFormField('email', "メールを入力してください。", _emailtextcontroller)
                          ),
                          SizedBox(height: 10),
                          AnimatedContainer(
                            height: _isSignUp?0:70,
                            duration: Duration(milliseconds: 1500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            decoration: BoxDecoration(
                                color: Colors.orange.shade50
                            ),
                            child: buildTextFormField('password', "パスワードを入力してください。", _passwordtextcontroller)
                          ),
                          SizedBox(height: 5),
                          Container(
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 120),
                                  color: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Text(_isSignUp?'新規登録':'ログイン', style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    if(_formKey.currentState!.validate()) {
                                      //todo: 入力チェックが正しいのか確認する。
                                      print('入力チェック完了');
                                      if (!_isSignUp) {
                                        Provider.of<PageNotifier>(context, listen: false).goToOtherPage(SmartingMain.pageName);
                                        //todo: ログイン情報が正しく転送されるのか確認する。
                                        print('ログイン完了');
                                        _formKey.currentState!.reset();
                                      } else {
                                        //todo : ユーザ情報を登録するための処理方法を考えて追加する。
                                        print('新規登録完了');
                                      }
                                    }
                                  }
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      // ignore: deprecated_member_use
                      child: FlatButton(
                          onPressed: (){
                            setState(() {
                              //todo: パスワードを忘れた方はこちらへの遷移先を追加する。
                            });
                          },
                          child: Text(
                            'パスワードを忘れた方はこちらへ',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.orange.shade900,
                              decoration: TextDecoration.underline
                            ),
                          )
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

  TextFormField buildTextFormField(String inputArea, String hintText, TextEditingController useController) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      controller: useController,
      //入力チェック
      validator: (inputData){
        // Nullチェック
        if(inputData == null || inputData.isEmpty){
          return '入力情報が空欄であります。';
        }
        // メール情報チェック
        if(inputArea == 'email'){
          if(!inputData.contains('@smarting.jp')){
            return '指定メール(@smarting.jp)を使用してください。';
          }
        }
        // パスワード情報チェック
        if(inputArea == 'password'){
          if(inputData.length < 8){
            return 'パスワードは８文字以上で入力してください。';
          }
        }
        return null;
      },
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        errorStyle: TextStyle(fontSize: 12,fontFamily: "OpenSans-Regular", color: Color(0xffe81935)),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius : BorderRadius.circular(4),
        borderSide: BorderSide(color: Colors.orange, width: 1)
    );
  }
}