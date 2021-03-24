import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/ui/pages/near-by/near-by_model.dart';
import 'package:foodee/src/ui/views/profile_view.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';

class NearBy extends StatefulWidget {
  @override
  _NearByState createState() => _NearByState();
}

class _NearByState extends State<NearBy> {
  int val;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
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
                      bottomRight: Radius.circular(30))),
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
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
        body: ListView.separated(
          padding: EdgeInsets.only(top: 10),
          itemCount: nearByModel.length,
          itemBuilder: (context, i) {
            return ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileView()));
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(nearByModel[i].url),
              ),
              title: ShaderText(
                shaderText: nearByModel[i].name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 0,);
          },
        ));
  }
}
