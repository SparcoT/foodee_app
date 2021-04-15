import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodee/src/base/assets.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/data/data.dart';
import 'package:openapi/openapi.dart';
import 'package:web_socket_channel/io.dart';

// ignore: must_be_immutable
class ChatPage extends StatefulWidget {
  int chatId;
  final IOWebSocketChannel socket;
  List<ChatMessages> chatListModel;

  ChatPage({this.chatListModel, this.socket, this.chatId});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  StreamSubscription subscription;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    listenForNewMessages();
  }

  dispose() {
    super.dispose();
    subscription.cancel();
  }

  listenForNewMessages() {
    subscription = widget.socket.stream.listen((event) {
      print("printing both");
      var data = json.decode(event);
      print('decode json');
      print(data);
      widget.chatListModel.insert(0, ChatMessages((b) {
        b.data = data['message'].toString();
        b.sender = int.parse(data['sender'].toString());
        // b.chat = widget.chatId;
      }));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: popMenuButton(),
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
              "Name 1",
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
          child: ListView.builder(
            itemCount: widget.chatListModel.length,
            reverse: true,
            itemBuilder: (context, i) {
              ChatMessages msg = widget.chatListModel[i];
              return msg.sender == AppData().getUserId()
                  ? container(
                      message: msg.data,
                      mainAxisAlignment: MainAxisAlignment.end,
                      bottomRight: 0,
                      bottomLeft: 20,
                      alignment: Alignment.topRight,
                      icon: true,
                      leftPadding: 70,
                      rightPadding: 15,
                      color: AppTheme.primaryColor.withOpacity(0.8),
                      boxAlignment: CrossAxisAlignment.end,
                    )
                  : container(
                      message: msg.data,
                      mainAxisAlignment: MainAxisAlignment.start,
                      bottomRight: 20,
                      bottomLeft: 0,
                      alignment: Alignment.topLeft,
                      icon: false,
                      leftPadding: 15,
                      rightPadding: 70,
                      color: Color(0xffe9ebe6),
                      //    Color(0xfff3f4f0),
                      textColor: Colors.black,
                      boxAlignment: CrossAxisAlignment.start,
                    );
            },
            padding: EdgeInsets.fromLTRB(0, 85, 0, 55),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  controller: controller,
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
                onPressed: () {
                  String test =
                      '{"message": "${controller.text}", "sender": ${AppData().getUserId()}, "chat": ${widget.chatId}}';
                  print(json.decode(test));
                  widget.socket.sink.add(test);
                  controller.clear();
                },
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

  Widget popMenuButton() {
    return PopupMenuButton(
      child: Icon(Icons.more_vert),

      //     key: _menuKey,
      itemBuilder: (_) => <PopupMenuItem>[
        PopupMenuItem(
            child: GestureDetector(onTap: () {}, child: Text('Block'))),
        PopupMenuItem<String>(
          child: GestureDetector(onTap: () {}, child: Text('Close')),
        ),
      ],
      onSelected: (_) {},
    );
  }

  Widget container({
    String message,
    MainAxisAlignment mainAxisAlignment,
    Alignment alignment,
    double leftPadding,
    double rightPadding,
    double bottomLeft,
    double bottomRight,
    bool icon,
    Color color,
    Color textColor,
    CrossAxisAlignment boxAlignment,
  }) {
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
          crossAxisAlignment: boxAlignment,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                message,
                style: TextStyle(color: textColor ?? Colors.white),
              ),
              decoration: BoxDecoration(
                  color: color,
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
