import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/theme.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Chat> chats = [];
  final _myId = '1';
  var _previousId = '';

  @override
  void initState() {
    super.initState();
    chats.add(Chat(message: 'Hey', senderId: '2', time: '04:37'));
    chats.add(Chat(message: 'Hey Butterfly', senderId: '2', time: '04:38'));
    chats.add(Chat(message: 'Yes', senderId: '1', time: '04:40'));
    chats.add(
      Chat(
          message: 'Why are you replying late???????',
          senderId: '2',
          time: '04:40'),
    );
    chats.add(Chat(message: 'Hmm', senderId: '1', time: '04:42'));
    chats.add(Chat(message: 'I am busy', senderId: '1', time: '04:37'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rashid'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.secondaryColor,
              AppTheme.primaryColor,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (ctx, index) {
                  Chat chat = chats[index];
                  var _isPrevious = false;
                  if (_previousId == chat.senderId)
                    _isPrevious = true;
                  else
                    _previousId = chat.senderId;
                  if (_previousId.isEmpty) _previousId = chat.senderId;
                  return _RowItem(
                    previousPerson: _isPrevious,
                    isMe: chat.senderId == _myId,
                    time: chat.time,
                    message: chat.message,
                  );
                },
              ),
            ),
            Material(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppTheme.primaryColor,
                      AppTheme.secondaryColor,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            hintText: 'Type Something...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white),
                            contentPadding: EdgeInsets.only(left: 15.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        width: 40,
                        height: 40.0,
                        child: TextButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 16,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(250.0),
                              // side: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RowItem extends StatelessWidget {
  final bool previousPerson;
  final bool isMe;
  final String message, time;

  _RowItem({
    this.isMe = true,
    this.time,
    this.message,
    this.previousPerson,
  });

  @override
  Widget build(BuildContext context) {
    final firstColor = isMe ? Color(0xffB18D81) : AppTheme.primaryColor;
    final secondColor = isMe ? Color(0xffC9AFA6) : AppTheme.primaryColor;
    final msgTxtColor = isMe?Colors.black: Colors.white;
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = isMe
        ? BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(previousPerson ? 18.0 : 0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          )
        : BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(previousPerson ? 18.0 : 0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          );
    return Column(
      crossAxisAlignment: align,
      children: [
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                firstColor,
                secondColor,
              ],
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: .5,
                spreadRadius: 1.0,
                color: Colors.black.withOpacity(.12),
              ),
            ],
            // color: bubbleColor,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 68.0),
                child: Text(
                  message,
                  style: TextStyle(color: msgTxtColor, fontSize: 15.0),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(
                      time,
                      style: TextStyle(
                        color: msgTxtColor,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Chat {
  String message, senderId, time;

  Chat({
    this.time,
    this.message,
    this.senderId,
  });
}
