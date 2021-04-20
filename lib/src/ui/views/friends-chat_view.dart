import 'package:flutter/material.dart';
import 'package:foodee/src/base/nav.dart';
import 'package:foodee/src/data/data.dart';
import 'package:foodee/src/ui/pages/chat/chat_page.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';
import 'package:intl/intl.dart';
import 'package:openapi/openapi.dart';
import 'package:web_socket_channel/io.dart';

class FriendsChatView extends StatefulWidget {
  @override
  _FriendsChatViewState createState() => _FriendsChatViewState();
}

class _FriendsChatViewState extends State<FriendsChatView> {
  var _chatListDetails = ChatsDetailList();

  _fetchData() async {
    final result = await Openapi()
        .getChatsApi()
        .chatsGetDetailedChatsRead(user: AppData().getUserId().toString());
    _chatListDetails = result.data;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        titleSpacing: 10,
        centerTitle: true,
        title: ShaderText(
          shaderText: "Chat",
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
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
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
        padding: EdgeInsets.only(top: 10),
        itemCount: _chatListDetails?.chats?.length ?? 0,
        itemBuilder: (context, i) {
          final _chat = _chatListDetails.chats.elementAt(i);
          return Column(
            children: [
              ListTile(
                onTap: () async {
                  try {
                    IOWebSocketChannel channel = IOWebSocketChannel.connect(
                        'ws://192.168.88.28:8000/ws/chat/${_chat.id}');
                    List<ChatMessages> messages = (await Openapi()
                        .getChatsApi()
                        .chatsGetMessagesRead(chat: _chat.id.toString()))
                        .data
                        .toList();
                    AppNavigation.to(
                      context,
                      ChatPage(
                        chatListModel: messages,
                        socket: channel,
                        chatId: _chat.id,
                        name: _chatListDetails.namesList.elementAt(i),
                      ),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                leading: CircleAvatar(
                  child: Text(_chatListDetails.namesList.elementAt(i)[0]),
                ),
                title: Text(_chatListDetails.namesList.elementAt(i)),
                subtitle: Text(
                  _chatListDetails.messageList.elementAt(i),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _chatListDetails.countList.elementAt(i) != '0'
                        ? CircleAvatar(
                      child: Text(
                        _chatListDetails.countList.elementAt(i),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      radius: 11,
                    )
                        : SizedBox(),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      _formatDate(_chatListDetails.updatedDate.elementAt(i)),
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
              )
            ],
          );
        },
      ),
    );
  }

  String _formatDate(String date) {
    final _date = DateTime.parse(date);
    return DateFormat('MMMMEEEEd').format(_date);
  }
}
