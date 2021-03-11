import 'package:flutter/material.dart';
import 'package:foodee/src/ui/pages/chat/chat_page.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';

class FriendsChatView extends StatefulWidget {
  @override
  _FriendsChatViewState createState() => _FriendsChatViewState();
}

class _FriendsChatViewState extends State<FriendsChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        titleSpacing: 10,
        centerTitle: true,
        title:          ShaderText(shaderText: "Chat",style: TextStyle(fontWeight: FontWeight.bold),)
        ,
        backgroundColor: Color(0xfff3f4f7),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xfff3f4f7),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60)),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
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
      body: ListView.builder(
        itemCount: chatListModel.length,
        itemBuilder: (context, i) {
          return chatListModel.isEmpty
              ? Center(
                  child: Text("NO Data"),
                )
              : Dismissible(
                  background: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      color: Colors.red),
                  onDismissed: (direction) {
                    setState(() {
                      chatListModel.removeAt(i);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${chatListModel[i].name} is Deleted")));
                  },
                  key: UniqueKey(),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                         // AppNavigation.to(context, ChatPage());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChatPage(
                                chatListModel: chatListModel[i],
                              )));
                        },
                        leading: CircleAvatar(
                          child: Text(chatListModel[i].name[0]),
                        ),
                        title: Text(chatListModel[i].name),
                        subtitle: Text(
                          chatListModel[i].message,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            chatListModel[i].unReadMessage.isNotEmpty
                                ? CircleAvatar(
                                    child: Text(
                                      chatListModel[i].unReadMessage,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11),
                                      textAlign: TextAlign.center,
                                    ),
                                    radius: 11,
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${chatListModel[i].dateTime.hour.toString()}:${chatListModel[i].dateTime.minute.toString()} pm  ",
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 0,
                        endIndent: 30,
                        indent: 70,
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}


class ChatListModel {
  String name;
  String message;
  DateTime dateTime;
  String unReadMessage;

  ChatListModel({this.dateTime, this.name, this.message, this.unReadMessage});
}

List<ChatListModel> chatListModel = [
  ChatListModel(
      name: "Usman",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "2"),
  ChatListModel(
      name: "Ali",
      message:
          "j askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "22"),
  ChatListModel(
      name: "Ahmad",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "9"),
  ChatListModel(
      name: "Usman",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: ""),
  ChatListModel(
      name: "Qasim",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "26"),
  ChatListModel(
      name: "Usman",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "2"),
  ChatListModel(
      name: "Ali",
      message:
          "j askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "22"),
  ChatListModel(
      name: "Ahmad",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "9"),
  ChatListModel(
      name: "Usman",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: ""),
  ChatListModel(
      name: "Qasim",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "26"),
  ChatListModel(
      name: "Usman",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "2"),
  ChatListModel(
      name: "Ali",
      message:
          "j askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "22"),
  ChatListModel(
      name: "Ahmad",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "9"),
  ChatListModel(
      name: "Usman",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: ""),
  ChatListModel(
      name: "Qasim",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "26"),
  ChatListModel(
      name: "Usman",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "2"),
  ChatListModel(
      name: "Ali",
      message:
          "j askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "22"),
  ChatListModel(
      name: "Ahmad",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "9"),
  ChatListModel(
      name: "Usman",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: ""),
  ChatListModel(
      name: "Qasim",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "26"),
  ChatListModel(
      name: "Usman",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "2"),
  ChatListModel(
      name: "Ali",
      message:
          "j askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "122"),
  ChatListModel(
      name: "Ahmad",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "9"),
  ChatListModel(
      name: "Usman",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: ""),
  ChatListModel(
      name: "Qasim",
      message:
          "fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk,fasfa kj askj dkas dkj asdk sakj dkjas dkj askjd sakjd skja dkjsa dk",
      dateTime: DateTime.now(),
      unReadMessage: "26"),
];
