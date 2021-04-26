import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ChatsApi
void main() {
  final instance = Openapi().getChatsApi();

  group(ChatsApi, () {
    //Future<Chats> chatsCreate(Chats data) async
    test('test chatsCreate', () async {
      // TODO
    });

    //Future<BuiltList<Chats>> chatsGetChatsRead(String user) async
    test('test chatsGetChatsRead', () async {
      // TODO
    });

    //Future<BuiltList<ChatMessages>> chatsGetMessagesRead(String chat) async
    test('test chatsGetMessagesRead', () async {
      // TODO
    });

    //Future<InlineResponse200> chatsList({ int limit, int offset }) async
    test('test chatsList', () async {
      // TODO
    });

    //Future<ChatMessages> chatsMessagesCreate(ChatMessages data, int id) async
    test('test chatsMessagesCreate', () async {
      // TODO
    });

    //Future<InlineResponse2001> chatsMessagesList(int id, { int limit, int offset }) async
    test('test chatsMessagesList', () async {
      // TODO
    });

  });
}
