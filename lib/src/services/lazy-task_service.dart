import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class LazyTaskService {
  static Widget _dialog = Dialog(
    child: Text('Loading'),
  );

  static set dialog(Widget dialog) => _dialog = dialog;

  static Future<T> execute<T>(
    BuildContext context,
    _LazyTask task, {
    Widget dialog,
    bool throwError = false,
    _ErrorBuilder errorBuilder,
  }) async {
    if (dialog == null) dialog = _dialog;
    if (dialog == null) throw 'No LoadingDialog was registered';
    T data;
    showDialog(context: context, builder: (context) => dialog);
    try {
      data = await task();
      Navigator.of(context).pop();
    } catch (e) {
      Navigator.of(context).pop();
      if (errorBuilder != null) {
        showDialog(context: context, builder: (context) => errorBuilder(e));
      }
      if (throwError) rethrow;
    }
    return data;
  }
}

typedef _ErrorBuilder = Widget Function(dynamic);
typedef _LazyTask<T> = Future<T> Function();
