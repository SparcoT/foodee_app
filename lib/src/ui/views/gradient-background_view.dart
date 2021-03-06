import 'package:flutter/material.dart';
import 'package:foodee/src/base/theme.dart';

class GradientBackgroundView extends DecoratedBox {
  GradientBackgroundView({Widget child})
      : super(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppTheme.primaryColor,
                AppTheme.primaryColor
              ],
            ),
          ),
        );
}
