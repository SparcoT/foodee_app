//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'feed_image.g.dart';



abstract class FeedImage implements Built<FeedImage, FeedImageBuilder> {
    @BuiltValueField(wireName: r'id')
    int? get id;

    @BuiltValueField(wireName: r'path')
    String? get path;

    @BuiltValueField(wireName: r'post')
    int get post;

    FeedImage._();

    static void _initializeBuilder(FeedImageBuilder b) => b;

    factory FeedImage([void updates(FeedImageBuilder b)]) = _$FeedImage;

    @BuiltValueSerializer(custom: true)
    static Serializer<FeedImage> get serializer => _$FeedImageSerializer();
}

class _$FeedImageSerializer implements StructuredSerializer<FeedImage> {
    @override
    final Iterable<Type> types = const [FeedImage, _$FeedImage];

    @override
    final String wireName = r'FeedImage';

    @override
    Iterable<Object?> serialize(Serializers serializers, FeedImage object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(int)));
        }
        if (object.path != null) {
            result
                ..add(r'path')
                ..add(serializers.serialize(object.path,
                    specifiedType: const FullType(String)));
        }
        result
            ..add(r'post')
            ..add(serializers.serialize(object.post,
                specifiedType: const FullType(int)));
        return result;
    }

    @override
    FeedImage deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = FeedImageBuilder();

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
                case r'path':
                    result.path = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'post':
                    result.post = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
            }
        }
        return result.build();
    }
}

