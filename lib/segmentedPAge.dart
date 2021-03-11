import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';

class SegmentedPage extends StatefulWidget {
  @override
  _SegmentedPageState createState() => _SegmentedPageState();
}

class _SegmentedPageState extends State<SegmentedPage> {
  int val;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        titleSpacing: 10,
        centerTitle: true,
        title: ShaderText(
          shaderText: "Search Your Near By",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xfff3f4f7),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xfff3f4f7),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                )
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60)),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Near By",
                      hintStyle: TextStyle(color: Colors.black26),
                      icon: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(Icons.search, color: Colors.black26),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                )),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: ShaderText(
        shaderText: 'Here you can search your near by',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}