//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'feed_comment_write.g.dart';



abstract class FeedCommentWrite implements Built<FeedCommentWrite, FeedCommentWriteBuilder> {
    @BuiltValueField(wireName: r'description')
    String get description;

    @BuiltValueField(wireName: r'user')
    int get user;

    FeedCommentWrite._();

    static void _initializeBuilder(FeedCommentWriteBuilder b) => b;

    factory FeedCommentWrite([void updates(FeedCommentWriteBuilder b)]) = _$FeedCommentWrite;

    @BuiltValueSerializer(custom: true)
    static Serializer<FeedCommentWrite> get serializer => _$FeedCommentWriteSerializer();
}

class _$FeedCommentWriteSerializer implements StructuredSerializer<FeedCommentWrite> {
    @override
    final Iterable<Type> types = const [FeedCommentWrite, _$FeedCommentWrite];

    @override
    final String wireName = r'FeedCommentWrite';

    @override
    Iterable<Object?> serialize(Serializers serializers, FeedCommentWrite object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'description')
            ..add(serializers.serialize(object.description,
                specifiedType: const FullType(String)));
        result
            ..add(r'user')
            ..add(serializers.serialize(object.user,
                specifiedType: const FullType(int)));
        return result;
    }

    @override
    FeedCommentWrite deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = FeedCommentWriteBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'description':
                    result.description = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'user':
                    result.user = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
            }
        }
        return result.build();
    }
}

