import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/pages/login_view.dart';
import 'package:smarting/pages/smarting_main.dart';
import 'package:smarting/provider/page_notifier.dart';


void main() {
  runApp(SmartingApp());
}

class SmartingApp extends StatelessWidget {

  // 画面遷移先のページ名
  static final String _GoLoginView = LoginView.pageName;
  static final String _GoSmartingMain = SmartingMain.pageName;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>PageNotifier())],
      child : MaterialApp(
        home: Consumer<PageNotifier>(
          builder: (context, pageNotifier, child){

            return Navigator(

                // 画面遷移先
                pages : [
                  MaterialPage(
                      key: ValueKey(_GoLoginView),
                      child: LoginView()
                  ),
                  if(pageNotifier.currentPage == _GoSmartingMain)SmartingMain(),
                ],

                // PopPage(バックページ)を防ぐ
                onPopPage:(route, result){
                  if(!route.didPop(result)){
                    return false;
                  }
                  return true;
                }
            );

          },
        )
      )
    );
  }
}
