import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/constants.dart';
import 'package:foodee/src/ui/widgets/post_widget.dart';

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Hero(
            tag: kPostTag,
            child: PostWidget(),
          ),
        ),
      ],
    );
  }
}
