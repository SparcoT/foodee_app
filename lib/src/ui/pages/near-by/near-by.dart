import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/data/data.dart';
import 'package:foodee/src/ui/pages/chat/chat_page.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';
import 'package:openapi/openapi.dart';
import 'package:web_socket_channel/io.dart';

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
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
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
      body: FutureBuilder(
        future: Openapi().getUsersApi().usersList(),
        builder: (context, AsyncSnapshot<Response<InlineResponse2003>> users) =>
            ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: users.data?.data?.results?.length ?? 0,
          itemBuilder: (context, i) {
            User user = users.data?.data?.results?.elementAt(i);
            return user.id != AppData().getUserId()
                ? Column(
                    children: [
                      ListTile(
                        onTap: () async {
                          int chatId = (await Openapi()
                                  .getChatsApi()
                                  .chatsCreate(data: Chats((builder) {
                            builder..user1 = AppData().getUserId();
                            builder..user2 = user.id;
                          })))
                              .data
                              .id;
                          try {
                            IOWebSocketChannel channel =
                                IOWebSocketChannel.connect(
                                    'ws://192.168.88.28:8000/ws/chat/$chatId');
                            List<ChatMessages> messages = (await Openapi()
                                    .getChatsApi()
                                    .chatsGetMessagesRead(
                                        chat: chatId.toString()))
                                .data
                                .toList();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChatPage(
                                  chatListModel: messages,
                                  socket: channel,
                                  chatId: chatId,
                                  name: user.firstName,
                                ),
                              ),
                            );
                          } catch (e) {
                            print(e);
                          }
                          // channel.sink.add({"message":"Hello how are you?", "sender":"${AppData().getUserId()}", "chat": '19'});
                        },
                        title: ShaderText(
                          shaderText: user.firstName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        height: 0,
                      )
                    ],
                  )
                : SizedBox();
          },
        ),
      ),
    );
  }
}
