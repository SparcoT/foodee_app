import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShaderText extends StatelessWidget {
  String shaderText;
  TextStyle style;
  ShaderText({this.shaderText,this.style});
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop, // Add this
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.topLeft,
          radius: 1.0,
          colors: <Color>[Colors.purple,Colors.purple[900]],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: Text(
        shaderText,
        style: style,
      ),
    );
  }
}
