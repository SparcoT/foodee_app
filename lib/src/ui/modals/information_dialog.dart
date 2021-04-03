import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future  openInfoDialog({
  @required BuildContext context,
  String title ,
  String content ,
  String ok = 'ok',
}) async {
  return await showCupertinoDialog(
    context: context,
    builder: (ctx) {
      return CupertinoAlertDialog(
        title:  Text(title,style: TextStyle(fontSize: 18),),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(ok),
          ),

        ],
      ) ;
    },
  );
}
