//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'feed_write.g.dart';



abstract class FeedWrite implements Built<FeedWrite, FeedWriteBuilder> {
    @BuiltValueField(wireName: r'id')
    int? get id;

    @BuiltValueField(wireName: r'description')
    String get description;

    @BuiltValueField(wireName: r'likes_count')
    int? get likesCount;

    @BuiltValueField(wireName: r'comments_count')
    int? get commentsCount;

    @BuiltValueField(wireName: r'updated_at')
    DateTime? get updatedAt;

    @BuiltValueField(wireName: r'created_at')
    DateTime? get createdAt;

    @BuiltValueField(wireName: r'user')
    int get user;

    @BuiltValueField(wireName: r'tags')
    BuiltSet<int>? get tags;

    FeedWrite._();

    static void _initializeBuilder(FeedWriteBuilder b) => b;

    factory FeedWrite([void updates(FeedWriteBuilder b)]) = _$FeedWrite;

    @BuiltValueSerializer(custom: true)
    static Serializer<FeedWrite> get serializer => _$FeedWriteSerializer();
}

class _$FeedWriteSerializer implements StructuredSerializer<FeedWrite> {
    @override
    final Iterable<Type> types = const [FeedWrite, _$FeedWrite];

    @override
    final String wireName = r'FeedWrite';

    @override
    Iterable<Object?> serialize(Serializers serializers, FeedWrite object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(int)));
        }
        result
            ..add(r'description')
            ..add(serializers.serialize(object.description,
                specifiedType: const FullType(String)));
        if (object.likesCount != null) {
            result
                ..add(r'likes_count')
                ..add(serializers.serialize(object.likesCount,
                    specifiedType: const FullType(int)));
        }
        if (object.commentsCount != null) {
            result
                ..add(r'comments_count')
                ..add(serializers.serialize(object.commentsCount,
                    specifiedType: const FullType(int)));
        }
        if (object.updatedAt != null) {
            result
                ..add(r'updated_at')
                ..add(serializers.serialize(object.updatedAt,
                    specifiedType: const FullType(DateTime)));
        }
        if (object.createdAt != null) {
            result
                ..add(r'created_at')
                ..add(serializers.serialize(object.createdAt,
                    specifiedType: const FullType(DateTime)));
        }
        result
            ..add(r'user')
            ..add(serializers.serialize(object.user,
                specifiedType: const FullType(int)));
        if (object.tags != null) {
            result
                ..add(r'tags')
                ..add(serializers.serialize(object.tags,
                    specifiedType: const FullType(BuiltSet, [FullType(int)])));
        }
        return result;
    }

    @override
    FeedWrite deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = FeedWriteBuilder();

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
                case r'description':
                    result.description = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'likes_count':
                    result.likesCount = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'comments_count':
                    result.commentsCount = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'updated_at':
                    result.updatedAt = serializers.deserialize(value,
                        specifiedType: const FullType(DateTime)) as DateTime;
                    break;
                case r'created_at':
                    result.createdAt = serializers.deserialize(value,
                        specifiedType: const FullType(DateTime)) as DateTime;
                    break;
                case r'user':
                    result.user = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'tags':
                    result.tags.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltSet, [FullType(int)])) as BuiltSet<int>);
                    break;
            }
        }
        return result.build();
    }
}

