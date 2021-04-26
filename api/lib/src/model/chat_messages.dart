//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chat_messages.g.dart';



abstract class ChatMessages implements Built<ChatMessages, ChatMessagesBuilder> {
    @BuiltValueField(wireName: r'id')
    int? get id;

    @BuiltValueField(wireName: r'data')
    String get data;

    @BuiltValueField(wireName: r'seen_at')
    DateTime? get seenAt;

    @BuiltValueField(wireName: r'sent_at')
    DateTime? get sentAt;

    @BuiltValueField(wireName: r'sender')
    int get sender;

    @BuiltValueField(wireName: r'chat')
    int get chat;

    ChatMessages._();

    static void _initializeBuilder(ChatMessagesBuilder b) => b;

    factory ChatMessages([void updates(ChatMessagesBuilder b)]) = _$ChatMessages;

    @BuiltValueSerializer(custom: true)
    static Serializer<ChatMessages> get serializer => _$ChatMessagesSerializer();
}

class _$ChatMessagesSerializer implements StructuredSerializer<ChatMessages> {
    @override
    final Iterable<Type> types = const [ChatMessages, _$ChatMessages];

    @override
    final String wireName = r'ChatMessages';

    @override
    Iterable<Object?> serialize(Serializers serializers, ChatMessages object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(int)));
        }
        result
            ..add(r'data')
            ..add(serializers.serialize(object.data,
                specifiedType: const FullType(String)));
        if (object.seenAt != null) {
            result
                ..add(r'seen_at')
                ..add(serializers.serialize(object.seenAt,
                    specifiedType: const FullType(DateTime)));
        }
        if (object.sentAt != null) {
            result
                ..add(r'sent_at')
                ..add(serializers.serialize(object.sentAt,
                    specifiedType: const FullType(DateTime)));
        }
        result
            ..add(r'sender')
            ..add(serializers.serialize(object.sender,
                specifiedType: const FullType(int)));
        result
            ..add(r'chat')
            ..add(serializers.serialize(object.chat,
                specifiedType: const FullType(int)));
        return result;
    }

    @override
    ChatMessages deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = ChatMessagesBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'id':
                    result.id = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'data':
                    result.data = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'seen_at':
                    result.seenAt = serializers.deserialize(value,
                        specifiedType: const FullType(DateTime)) as DateTime;
                    break;
                case r'sent_at':
                    result.sentAt = serializers.deserialize(value,
                        specifiedType: const FullType(DateTime)) as DateTime;
                    break;
                case r'sender':
                    result.sender = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'chat':
                    result.chat = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
            }
        }
        return result.build();
    }
}

