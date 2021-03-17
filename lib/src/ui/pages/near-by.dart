import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodee/src/ui/pages/shader_Text.dart';

import 'image-models.dart';

class NearBy extends StatefulWidget {
  @override
  _NearByState createState() => _NearByState();
}

class _NearByState extends State<NearBy> {
  bool isBool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 4,
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
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: "Search Near By",
                      hintStyle: TextStyle(color: Colors.black26),
                      icon: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(Icons.search, color: Colors.black26),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: imageModel.length,
          itemBuilder: (BuildContext context, int i) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10 ),
              child: Material(
                borderRadius: BorderRadius.circular(8),
elevation: 4,              child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        imageModel[i].url,
                      ),
                    ),
                    title: Text(imageModel[i].url[0]),
                    subtitle: Text('Hello World'),
                    trailing: Icon(CupertinoIcons.chevron_compact_right),
                  ),
                ),
              ),
            );
            // return Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            //   elevation: 8,
            //   borderOnForeground: true,
            //   child: ,
            // );
          },
        )
        // : ListView.builder(
        //     padding: EdgeInsets.all(10),
        //     itemBuilder: (context, i) {
        //       return Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 20),
        //         child: Card(
        //             elevation: 8,
        //             borderOnForeground: true,
        //             shadowColor: i % 2 == 0 ? Colors.grey : Colors.teal,
        //             color: i % 2 == 0 ? Colors.yellow : Colors.pinkAccent,
        //             child: ListTile(
        //               leading: CircleAvatar(
        //                 backgroundColor:
        //                     i % 2 == 0 ? Colors.pinkAccent : Colors.yellow,
        //               ),
        //             )),
        //       );
        //     }),
        );
  }
}
