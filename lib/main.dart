import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/pages/login_view.dart';
import 'package:smarting/pages/smarting_main.dart';
import 'package:smarting/provider/page_notifier.dart';


void main() {
  runApp(SmartingApp());
}

class SmartingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>PageNotifier())],
      child : MaterialApp(
        home: Consumer<PageNotifier>(
          builder: (context, pageNotifier, child){
            return Navigator(
                pages : [
                  MaterialPage(
                      key: ValueKey(LoginView.pageName),
                      child: LoginView(title: '臨時ログイン画面')
                  ),
                  if(pageNotifier.currentPage == SmartingAppMenu.pageName)SmartingAppMenu(),
                ],
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
