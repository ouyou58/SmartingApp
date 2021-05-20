import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum SlidableAction { delete }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget({
    required this.child,
    required this.onDismissed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: child,
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Colors.amber[300],
            icon: Icons.delete,
            onTap: () => _showDialog(context),
          ),
        ],
      );

  void _showDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: new Text('削除しますか'),
            content: new Text('削除'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              new FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  //onDismissed(SlidableAction.delete),

                  child: new Text('いいえ')
              ),
              // ignore: deprecated_member_use
              new FlatButton(
                  onPressed: () => deleteData(context),
                  child: new Text('はい')
              ),
            ],
          );
        }
    );
  }

  void deleteData(BuildContext context){
    onDismissed(SlidableAction.delete);
    Navigator.of(context).pop();
  }
}
