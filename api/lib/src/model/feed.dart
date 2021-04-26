//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/feed_image.dart';
import 'package:openapi/src/model/feed_user.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'feed.g.dart';



abstract class Feed implements Built<Feed, FeedBuilder> {
    @BuiltValueField(wireName: r'id')
    int? get id;

    @BuiltValueField(wireName: r'description')
    String get description;

    @BuiltValueField(wireName: r'comments_count')
    int? get commentsCount;

    @BuiltValueField(wireName: r'likes_count')
    int? get likesCount;

    @BuiltValueField(wireName: r'updated_at')
    DateTime? get updatedAt;

    @BuiltValueField(wireName: r'created_at')
    DateTime? get createdAt;

    @BuiltValueField(wireName: r'tags')
    BuiltSet<int>? get tags;

    @BuiltValueField(wireName: r'images')
    BuiltList<FeedImage>? get images;

    @BuiltValueField(wireName: r'user')
    FeedUser get user;

    Feed._();

    static void _initializeBuilder(FeedBuilder b) => b;

    factory Feed([void updates(FeedBuilder b)]) = _$Feed;

    @BuiltValueSerializer(custom: true)
    static Serializer<Feed> get serializer => _$FeedSerializer();
}

class _$FeedSerializer implements StructuredSerializer<Feed> {
    @override
    final Iterable<Type> types = const [Feed, _$Feed];

    @override
    final String wireName = r'Feed';

    @override
    Iterable<Object?> serialize(Serializers serializers, Feed object,
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
        if (object.commentsCount != null) {
            result
                ..add(r'comments_count')
                ..add(serializers.serialize(object.commentsCount,
                    specifiedType: const FullType(int)));
        }
        if (object.likesCount != null) {
            result
                ..add(r'likes_count')
                ..add(serializers.serialize(object.likesCount,
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
        if (object.tags != null) {
            result
                ..add(r'tags')
                ..add(serializers.serialize(object.tags,
                    specifiedType: const FullType(BuiltSet, [FullType(int)])));
        }
        if (object.images != null) {
            result
                ..add(r'images')
                ..add(serializers.serialize(object.images,
                    specifiedType: const FullType(BuiltList, [FullType(FeedImage)])));
        }
        result
            ..add(r'user')
            ..add(serializers.serialize(object.user,
                specifiedType: const FullType(FeedUser)));
        return result;
    }

    @override
    Feed deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = FeedBuilder();

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
                case r'comments_count':
                    result.commentsCount = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'likes_count':
                    result.likesCount = serializers.deserialize(value,
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
                case r'tags':
                    result.tags.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltSet, [FullType(int)])) as BuiltSet<int>);
                    break;
                case r'images':
                    result.images.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(FeedImage)])) as BuiltList<FeedImage>);
                    break;
                case r'user':
                    result.user.replace(serializers.deserialize(value,
                        specifiedType: const FullType(FeedUser)) as FeedUser);
                    break;
            }
        }
        return result.build();
    }
}

