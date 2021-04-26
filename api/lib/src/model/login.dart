//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login.g.dart';



abstract class Login implements Built<Login, LoginBuilder> {
    /// Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.
    @BuiltValueField(wireName: r'username')
    String get username;

    @BuiltValueField(wireName: r'password')
    String get password;

    Login._();

    static void _initializeBuilder(LoginBuilder b) => b;

    factory Login([void updates(LoginBuilder b)]) = _$Login;

    @BuiltValueSerializer(custom: true)
    static Serializer<Login> get serializer => _$LoginSerializer();
}

class _$LoginSerializer implements StructuredSerializer<Login> {
    @override
    final Iterable<Type> types = const [Login, _$Login];

    @override
    final String wireName = r'Login';

    @override
    Iterable<Object?> serialize(Serializers serializers, Login object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'username')
            ..add(serializers.serialize(object.username,
                specifiedType: const FullType(String)));
        result
            ..add(r'password')
            ..add(serializers.serialize(object.password,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    Login deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = LoginBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'username':
                    result.username = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'password':
                    result.password = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
            }
        }
        return result.build();
    }
}

