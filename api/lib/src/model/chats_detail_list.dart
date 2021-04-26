//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/chats.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'chats_detail_list.g.dart';



abstract class ChatsDetailList implements Built<ChatsDetailList, ChatsDetailListBuilder> {
    @BuiltValueField(wireName: r'message_list')
    BuiltList<String> get messageList;

    @BuiltValueField(wireName: r'updated_date')
    BuiltList<String> get updatedDate;

    @BuiltValueField(wireName: r'count_list')
    BuiltList<String> get countList;

    @BuiltValueField(wireName: r'names_list')
    BuiltList<String> get namesList;

    @BuiltValueField(wireName: r'chats')
    BuiltList<Chats> get chats;

    ChatsDetailList._();

    static void _initializeBuilder(ChatsDetailListBuilder b) => b;

    factory ChatsDetailList([void updates(ChatsDetailListBuilder b)]) = _$ChatsDetailList;

    @BuiltValueSerializer(custom: true)
    static Serializer<ChatsDetailList> get serializer => _$ChatsDetailListSerializer();
}

class _$ChatsDetailListSerializer implements StructuredSerializer<ChatsDetailList> {
    @override
    final Iterable<Type> types = const [ChatsDetailList, _$ChatsDetailList];

    @override
    final String wireName = r'ChatsDetailList';

    @override
    Iterable<Object?> serialize(Serializers serializers, ChatsDetailList object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'message_list')
            ..add(serializers.serialize(object.messageList,
                specifiedType: const FullType(BuiltList, [FullType(String)])));
        result
            ..add(r'updated_date')
            ..add(serializers.serialize(object.updatedDate,
                specifiedType: const FullType(BuiltList, [FullType(String)])));
        result
            ..add(r'count_list')
            ..add(serializers.serialize(object.countList,
                specifiedType: const FullType(BuiltList, [FullType(String)])));
        result
            ..add(r'names_list')
            ..add(serializers.serialize(object.namesList,
                specifiedType: const FullType(BuiltList, [FullType(String)])));
        result
            ..add(r'chats')
            ..add(serializers.serialize(object.chats,
                specifiedType: const FullType(BuiltList, [FullType(Chats)])));
        return result;
    }

    @override
    ChatsDetailList deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = ChatsDetailListBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'message_list':
                    result.messageList.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(String)])) as BuiltList<String>);
                    break;
                case r'updated_date':
                    result.updatedDate.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(String)])) as BuiltList<String>);
                    break;
                case r'count_list':
                    result.countList.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(String)])) as BuiltList<String>);
                    break;
                case r'names_list':
                    result.namesList.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(String)])) as BuiltList<String>);
                    break;
                case r'chats':
                    result.chats.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(Chats)])) as BuiltList<Chats>);
                    break;
            }
        }
        return result.build();
    }
}

