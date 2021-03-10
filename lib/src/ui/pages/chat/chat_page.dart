import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodee/src/base/assets.dart';
import 'package:foodee/src/base/theme.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 5,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CircleAvatar(radius: 16, backgroundColor: Colors.white),
            SizedBox(
              width: 8,
            ),
            Text(
              "Osama Sandhu",
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))),
      ),
      body: ClipPath(
        clipper: ClipperCustom(MediaQuery.of(context).padding.top, 40),
        child: Container(
          // padding: EdgeInsets.only(
          //     top: MediaQuery.of(context).padding.top + kToolbarHeight),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, i) {
              return i % 2 == 0
                  ? container(
                      mainAxisAlignment: MainAxisAlignment.end,
                      bottomRight: 0,
                      bottomLeft: 20,
                      alignment: Alignment.topRight,
                      icon: true,
                      leftPadding: 70,
                      rightPadding: 15,
                      color: AppTheme.primaryColor.withOpacity(0.8))
                  : container(
                      mainAxisAlignment: MainAxisAlignment.start,
                      bottomRight: 20,
                      bottomLeft: 0,
                      alignment: Alignment.topLeft,
                      icon: false,
                      leftPadding: 15,
                      rightPadding: 70,
                      color:
 Color(0xffe9ebe6),                 //    Color(0xfff3f4f0),
                  textColor: Colors.black);
            },
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Type here something...',
                    hintStyle: TextStyle(
                      fontSize: 13,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            SizedBox(
              width: 40,
              height: 40,
              child: TextButton(
                onPressed: () {},
                child: SvgPicture.asset(
                  AppAssets.send,
                  color: Colors.white,
                  width: 23,
                ),
                // child: Icon(
                //   CupertinoIcons.search,
                //   color: Colors.white,
                // ),
                style: TextButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.zero,
                  backgroundColor: AppTheme.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget container(
      {MainAxisAlignment mainAxisAlignment,
      Alignment alignment,
      double leftPadding,
      double rightPadding,
      double bottomLeft,
      double bottomRight,
      bool icon,
      Color color,
        Color textColor}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        leftPadding,
        15,
        rightPadding,
        5,
      ),
      child: Align(
        alignment: alignment,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(" Osama Sandhu Hello!"
                  " Osama Sandhu Hello!"
                  " Osama Sandhu Hello!"
                  " Osama Sandhu Hello!"
                  " Osama Sandhu Hello!",style: TextStyle(color:textColor??Colors.white),),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(

                )],  color: color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(bottomLeft),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(bottomRight))),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: mainAxisAlignment,
              children: [
                Text("2:23 pm"),
                SizedBox(
                  width: 3,
                ),
                icon
                    ? Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 20,
                      )
                    : SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ClipperCustom extends CustomClipper<Path> {
  final double padding;
  final double radius;

  ClipperCustom(this.padding, this.radius);

  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, padding)
      ..lineTo(0, padding + kToolbarHeight - radius)
      ..quadraticBezierTo(
          0, kToolbarHeight + padding, radius, kToolbarHeight + padding)
      // ..lineTo(radius, kToolbarHeight + padding)
      ..lineTo(size.width - radius, kToolbarHeight + padding)
      ..quadraticBezierTo(size.width, kToolbarHeight + padding, size.width,
          kToolbarHeight + padding + radius)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
