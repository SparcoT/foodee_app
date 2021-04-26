//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';

import 'package:openapi/src/model/chat_messages.dart';
import 'package:openapi/src/model/chats.dart';
import 'package:openapi/src/model/chats_detail_list.dart';
import 'package:openapi/src/model/feed.dart';
import 'package:openapi/src/model/feed_comment_write.dart';
import 'package:openapi/src/model/feed_image.dart';
import 'package:openapi/src/model/feed_user.dart';
import 'package:openapi/src/model/feed_write.dart';
import 'package:openapi/src/model/inline_response200.dart';
import 'package:openapi/src/model/inline_response2001.dart';
import 'package:openapi/src/model/inline_response2002.dart';
import 'package:openapi/src/model/inline_response2003.dart';
import 'package:openapi/src/model/login.dart';
import 'package:openapi/src/model/login_response.dart';
import 'package:openapi/src/model/user.dart';
import 'package:openapi/src/model/verify_account_response.dart';

part 'serializers.g.dart';

@SerializersFor([
  ChatMessages,
  Chats,
  ChatsDetailList,
  Feed,
  FeedCommentWrite,
  FeedImage,
  FeedUser,
  FeedWrite,
  InlineResponse200,
  InlineResponse2001,
  InlineResponse2002,
  InlineResponse2003,
  Login,
  LoginResponse,
  User,
  VerifyAccountResponse,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ChatMessages)]),
        () => ListBuilder<ChatMessages>(),
      )
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
