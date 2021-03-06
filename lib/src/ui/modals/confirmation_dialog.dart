import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> openConfirmationDialog({
  @required BuildContext context,
  String title = 'title',
  String content = '',
  String yes = 'Yes',
  String no = 'No',
}) async {
  return await showCupertinoDialog(
    context: context,
    builder: (ctx) {
      return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                child: Text(yes),
              ),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: Text(no),
              ),
            ],
          ) ??
          false;
    },
  );
}
