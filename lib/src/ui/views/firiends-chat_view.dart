import 'package:flutter/material.dart';
import 'package:foodee/src/base/nav.dart';
import 'package:foodee/src/ui/pages/chat/chat_page.dart';

class FriendsChatView extends StatefulWidget {
  @override
  _FriendsChatViewState createState() => _FriendsChatViewState();
}

class _FriendsChatViewState extends State<FriendsChatView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                        AppNavigation.to(context, ChatPage());
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => ChatScreen(
                        //       chatListModel: chatListModel[i],
                        //     )));
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
];
