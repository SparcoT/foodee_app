//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/user.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'inline_response2003.g.dart';



abstract class InlineResponse2003 implements Built<InlineResponse2003, InlineResponse2003Builder> {
    @BuiltValueField(wireName: r'count')
    int get count;

    @BuiltValueField(wireName: r'next')
    String? get next;

    @BuiltValueField(wireName: r'previous')
    String? get previous;

    @BuiltValueField(wireName: r'results')
    BuiltList<User> get results;

    InlineResponse2003._();

    static void _initializeBuilder(InlineResponse2003Builder b) => b;

    factory InlineResponse2003([void updates(InlineResponse2003Builder b)]) = _$InlineResponse2003;

    @BuiltValueSerializer(custom: true)
    static Serializer<InlineResponse2003> get serializer => _$InlineResponse2003Serializer();
}

class _$InlineResponse2003Serializer implements StructuredSerializer<InlineResponse2003> {
    @override
    final Iterable<Type> types = const [InlineResponse2003, _$InlineResponse2003];

    @override
    final String wireName = r'InlineResponse2003';

    @override
    Iterable<Object?> serialize(Serializers serializers, InlineResponse2003 object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'count')
            ..add(serializers.serialize(object.count,
                specifiedType: const FullType(int)));
        if (object.next != null) {
            result
                ..add(r'next')
                ..add(serializers.serialize(object.next,
                    specifiedType: const FullType(String)));
        }
        if (object.previous != null) {
            result
                ..add(r'previous')
                ..add(serializers.serialize(object.previous,
                    specifiedType: const FullType(String)));
        }
        result
            ..add(r'results')
            ..add(serializers.serialize(object.results,
                specifiedType: const FullType(BuiltList, [FullType(User)])));
        return result;
    }

    @override
    InlineResponse2003 deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = InlineResponse2003Builder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'count':
                    result.count = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'next':
                    result.next = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'previous':
                    result.previous = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'results':
                    result.results.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(User)])) as BuiltList<User>);
                    break;
            }
        }
        return result.build();
    }
}

