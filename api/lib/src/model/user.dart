//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';



abstract class User implements Built<User, UserBuilder> {
    @BuiltValueField(wireName: r'id')
    int? get id;

    @BuiltValueField(wireName: r'password')
    String get password;

    @BuiltValueField(wireName: r'last_login')
    DateTime? get lastLogin;

    /// Designates that this user has all permissions without explicitly assigning them.
    @BuiltValueField(wireName: r'is_superuser')
    bool? get isSuperuser;

    /// Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.
    @BuiltValueField(wireName: r'username')
    String get username;

    /// Designates whether the user can log into this admin site.
    @BuiltValueField(wireName: r'is_staff')
    bool? get isStaff;

    /// Designates whether this user should be treated as active. Unselect this instead of deleting accounts.
    @BuiltValueField(wireName: r'is_active')
    bool? get isActive;

    @BuiltValueField(wireName: r'date_joined')
    DateTime? get dateJoined;

    @BuiltValueField(wireName: r'age')
    int? get age;

    @BuiltValueField(wireName: r'address')
    String? get address;

    @BuiltValueField(wireName: r'email')
    String get email;

    @BuiltValueField(wireName: r'first_name')
    String get firstName;

    @BuiltValueField(wireName: r'last_name')
    String get lastName;

    @BuiltValueField(wireName: r'gender')
    String? get gender;

    @BuiltValueField(wireName: r'phone')
    String? get phone;

    @BuiltValueField(wireName: r'image')
    String? get image;

    @BuiltValueField(wireName: r'isAgePublic')
    bool? get isAgePublic;

    @BuiltValueField(wireName: r'contribution')
    int? get contribution;

    @BuiltValueField(wireName: r'deviceToken')
    String? get deviceToken;

    @BuiltValueField(wireName: r'location')
    String? get location;

    @BuiltValueField(wireName: r'status')
    bool? get status;

    @BuiltValueField(wireName: r'verification_token')
    String? get verificationToken;

    /// The groups this user belongs to. A user will get all permissions granted to each of their groups.
    @BuiltValueField(wireName: r'groups')
    BuiltSet<int>? get groups;

    /// Specific permissions for this user.
    @BuiltValueField(wireName: r'user_permissions')
    BuiltSet<int>? get userPermissions;

    User._();

    static void _initializeBuilder(UserBuilder b) => b;

    factory User([void updates(UserBuilder b)]) = _$User;

    @BuiltValueSerializer(custom: true)
    static Serializer<User> get serializer => _$UserSerializer();
}

class _$UserSerializer implements StructuredSerializer<User> {
    @override
    final Iterable<Type> types = const [User, _$User];

    @override
    final String wireName = r'User';

    @override
    Iterable<Object?> serialize(Serializers serializers, User object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(int)));
        }
        result
            ..add(r'password')
            ..add(serializers.serialize(object.password,
                specifiedType: const FullType(String)));
        if (object.lastLogin != null) {
            result
                ..add(r'last_login')
                ..add(serializers.serialize(object.lastLogin,
                    specifiedType: const FullType(DateTime)));
        }
        if (object.isSuperuser != null) {
            result
                ..add(r'is_superuser')
                ..add(serializers.serialize(object.isSuperuser,
                    specifiedType: const FullType(bool)));
        }
        result
            ..add(r'username')
            ..add(serializers.serialize(object.username,
                specifiedType: const FullType(String)));
        if (object.isStaff != null) {
            result
                ..add(r'is_staff')
                ..add(serializers.serialize(object.isStaff,
                    specifiedType: const FullType(bool)));
        }
        if (object.isActive != null) {
            result
                ..add(r'is_active')
                ..add(serializers.serialize(object.isActive,
                    specifiedType: const FullType(bool)));
        }
        if (object.dateJoined != null) {
            result
                ..add(r'date_joined')
                ..add(serializers.serialize(object.dateJoined,
                    specifiedType: const FullType(DateTime)));
        }
        if (object.age != null) {
            result
                ..add(r'age')
                ..add(serializers.serialize(object.age,
                    specifiedType: const FullType(int)));
        }
        if (object.address != null) {
            result
                ..add(r'address')
                ..add(serializers.serialize(object.address,
                    specifiedType: const FullType(String)));
        }
        result
            ..add(r'email')
            ..add(serializers.serialize(object.email,
                specifiedType: const FullType(String)));
        result
            ..add(r'first_name')
            ..add(serializers.serialize(object.firstName,
                specifiedType: const FullType(String)));
        result
            ..add(r'last_name')
            ..add(serializers.serialize(object.lastName,
                specifiedType: const FullType(String)));
        if (object.gender != null) {
            result
                ..add(r'gender')
                ..add(serializers.serialize(object.gender,
                    specifiedType: const FullType(String)));
        }
        if (object.phone != null) {
            result
                ..add(r'phone')
                ..add(serializers.serialize(object.phone,
                    specifiedType: const FullType(String)));
        }
        if (object.image != null) {
            result
                ..add(r'image')
                ..add(serializers.serialize(object.image,
                    specifiedType: const FullType(String)));
        }
        if (object.isAgePublic != null) {
            result
                ..add(r'isAgePublic')
                ..add(serializers.serialize(object.isAgePublic,
                    specifiedType: const FullType(bool)));
        }
        if (object.contribution != null) {
            result
                ..add(r'contribution')
                ..add(serializers.serialize(object.contribution,
                    specifiedType: const FullType(int)));
        }
        if (object.deviceToken != null) {
            result
                ..add(r'deviceToken')
                ..add(serializers.serialize(object.deviceToken,
                    specifiedType: const FullType(String)));
        }
        if (object.location != null) {
            result
                ..add(r'location')
                ..add(serializers.serialize(object.location,
                    specifiedType: const FullType(String)));
        }
        if (object.status != null) {
            result
                ..add(r'status')
                ..add(serializers.serialize(object.status,
                    specifiedType: const FullType(bool)));
        }
        if (object.verificationToken != null) {
            result
                ..add(r'verification_token')
                ..add(serializers.serialize(object.verificationToken,
                    specifiedType: const FullType(String)));
        }
        if (object.groups != null) {
            result
                ..add(r'groups')
                ..add(serializers.serialize(object.groups,
                    specifiedType: const FullType(BuiltSet, [FullType(int)])));
        }
        if (object.userPermissions != null) {
            result
                ..add(r'user_permissions')
                ..add(serializers.serialize(object.userPermissions,
                    specifiedType: const FullType(BuiltSet, [FullType(int)])));
        }
        return result;
    }

    @override
    User deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = UserBuilder();

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
                case r'password':
                    result.password = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'last_login':
                    result.lastLogin = serializers.deserialize(value,
                        specifiedType: const FullType(DateTime)) as DateTime;
                    break;
                case r'is_superuser':
                    result.isSuperuser = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    break;
                case r'username':
                    result.username = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'is_staff':
                    result.isStaff = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    break;
                case r'is_active':
                    result.isActive = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    break;
                case r'date_joined':
                    result.dateJoined = serializers.deserialize(value,
                        specifiedType: const FullType(DateTime)) as DateTime;
                    break;
                case r'age':
                    result.age = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'address':
                    result.address = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'email':
                    result.email = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'first_name':
                    result.firstName = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'last_name':
                    result.lastName = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'gender':
                    result.gender = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'phone':
                    result.phone = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'image':
                    result.image = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'isAgePublic':
                    result.isAgePublic = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    break;
                case r'contribution':
                    result.contribution = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'deviceToken':
                    result.deviceToken = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'location':
                    result.location = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'status':
                    result.status = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    break;
                case r'verification_token':
                    result.verificationToken = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'groups':
                    result.groups.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltSet, [FullType(int)])) as BuiltSet<int>);
                    break;
                case r'user_permissions':
                    result.userPermissions.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltSet, [FullType(int)])) as BuiltSet<int>);
                    break;
            }
        }
        return result.build();
    }
}

