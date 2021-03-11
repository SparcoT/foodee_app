import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../base/foodee-loading-dialog.dart';

Future<dynamic> performLazyTask(
  BuildContext context,
  Future<dynamic> Function() task, {
  String message = 'Please Wait',
  bool persistent = true,
}) async {
  if (persistent) {
    openLoadingDialog(context, message);
  } else {
    openLoadingDialog(context, message);
  }

  final result = await task();
  Navigator.of(context).pop();

  return result;
}
