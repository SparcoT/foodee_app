//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chats.g.dart';



abstract class Chats implements Built<Chats, ChatsBuilder> {
    @BuiltValueField(wireName: r'id')
    int? get id;

    @BuiltValueField(wireName: r'created_at')
    DateTime? get createdAt;

    @BuiltValueField(wireName: r'user1')
    int get user1;

    @BuiltValueField(wireName: r'user2')
    int get user2;

    Chats._();

    static void _initializeBuilder(ChatsBuilder b) => b;

    factory Chats([void updates(ChatsBuilder b)]) = _$Chats;

    @BuiltValueSerializer(custom: true)
    static Serializer<Chats> get serializer => _$ChatsSerializer();
}

class _$ChatsSerializer implements StructuredSerializer<Chats> {
    @override
    final Iterable<Type> types = const [Chats, _$Chats];

    @override
    final String wireName = r'Chats';

    @override
    Iterable<Object?> serialize(Serializers serializers, Chats object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(int)));
        }
        if (object.createdAt != null) {
            result
                ..add(r'created_at')
                ..add(serializers.serialize(object.createdAt,
                    specifiedType: const FullType(DateTime)));
        }
        result
            ..add(r'user1')
            ..add(serializers.serialize(object.user1,
                specifiedType: const FullType(int)));
        result
            ..add(r'user2')
            ..add(serializers.serialize(object.user2,
                specifiedType: const FullType(int)));
        return result;
    }

    @override
    Chats deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = ChatsBuilder();

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
                case r'created_at':
                    result.createdAt = serializers.deserialize(value,
                        specifiedType: const FullType(DateTime)) as DateTime;
                    break;
                case r'user1':
                    result.user1 = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'user2':
                    result.user2 = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
            }
        }
        return result.build();
    }
}

