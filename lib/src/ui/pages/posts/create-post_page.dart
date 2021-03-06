import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/ui/views/image-picker_widget.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<File> _images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.zero,
        middle: Text(
          'Create Post',
          style: TextStyle(color: AppTheme.primaryColor),
        ),
        trailing: TextButton(
          child: Icon(
            CupertinoIcons.add,
            size: 25,
            color: AppTheme.primaryColor,
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(0),
            shape: CircleBorder(),
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type here something....',
                ),
              ),
              Wrap(
                children: [
                  TaggedUser(name: 'Rashid'),
                  TaggedUser(name: 'Arish'),
                  TaggedUser(name: 'Asad'),
                  TaggedUser(name: 'Usama'),
                  TaggedUser(name: 'Zain'),
                  TaggedUser(name: 'Nabeel'),
                  TaggedUser(name: 'Haroon'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: SizedBox(
                  height: 300,
                  child: ImagePickerWidget(
                    images: _images,
                    onChanged: (value) => _images = value,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaggedUser extends StatelessWidget {
  final String name;

  TaggedUser({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      padding: EdgeInsets.fromLTRB(10, 3, 7, 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppTheme.secondaryColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
          SizedBox(width: 7),
          Icon(
            CupertinoIcons.clear,
            size: 10,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
