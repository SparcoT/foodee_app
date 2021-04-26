//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verify_account_response.g.dart';



abstract class VerifyAccountResponse implements Built<VerifyAccountResponse, VerifyAccountResponseBuilder> {
    @BuiltValueField(wireName: r'message')
    String get message;

    VerifyAccountResponse._();

    static void _initializeBuilder(VerifyAccountResponseBuilder b) => b;

    factory VerifyAccountResponse([void updates(VerifyAccountResponseBuilder b)]) = _$VerifyAccountResponse;

    @BuiltValueSerializer(custom: true)
    static Serializer<VerifyAccountResponse> get serializer => _$VerifyAccountResponseSerializer();
}

class _$VerifyAccountResponseSerializer implements StructuredSerializer<VerifyAccountResponse> {
    @override
    final Iterable<Type> types = const [VerifyAccountResponse, _$VerifyAccountResponse];

    @override
    final String wireName = r'VerifyAccountResponse';

    @override
    Iterable<Object?> serialize(Serializers serializers, VerifyAccountResponse object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'message')
            ..add(serializers.serialize(object.message,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    VerifyAccountResponse deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = VerifyAccountResponseBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'message':
                    result.message = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
            }
        }
        return result.build();
    }
}

