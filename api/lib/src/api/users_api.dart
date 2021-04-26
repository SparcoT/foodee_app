//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:openapi/src/model/verify_account_response.dart';
import 'package:openapi/src/model/login_response.dart';
import 'package:openapi/src/model/inline_response2003.dart';
import 'package:openapi/src/model/login.dart';
import 'package:openapi/src/model/user.dart';
import 'package:openapi/src/api_util.dart';
import 'dart:typed_data';
import 'package:built_collection/built_collection.dart';

class UsersApi {

  final Dio _dio;

  final Serializers _serializers;

  const UsersApi(this._dio, this._serializers);

  /// 
  ///
  /// 
  Future<Response<User>> usersCreate({ 
    required String password,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    DateTime? lastLogin,
    bool? isSuperuser,
    bool? isStaff,
    bool? isActive,
    DateTime? dateJoined,
    int? age,
    String? address,
    String? gender,
    String? phone,
    Uint8List? image,
    bool? isAgePublic,
    int? contribution,
    String? deviceToken,
    String? location,
    bool? status,
    String? verificationToken,
    BuiltSet<int>? groups,
    BuiltSet<int>? userPermissions,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/users/';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'name': 'Basic',
          },
        ],
        ...?extra,
      },
      contentType: [
        'application/x-www-form-urlencoded',
        'multipart/form-data',
      ].first,
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
    };

    dynamic _bodyData;

    try {
      _bodyData = <String, dynamic>{
        r'password': encodeFormParameter(_serializers, password, const FullType(String)),
        r'last_login': encodeFormParameter(_serializers, lastLogin, const FullType(DateTime)),
        if (isSuperuser != null) r'is_superuser': encodeFormParameter(_serializers, isSuperuser, const FullType(bool)),
        r'username': encodeFormParameter(_serializers, username, const FullType(String)),
        if (isStaff != null) r'is_staff': encodeFormParameter(_serializers, isStaff, const FullType(bool)),
        if (isActive != null) r'is_active': encodeFormParameter(_serializers, isActive, const FullType(bool)),
        if (dateJoined != null) r'date_joined': encodeFormParameter(_serializers, dateJoined, const FullType(DateTime)),
        r'age': encodeFormParameter(_serializers, age, const FullType(int)),
        r'address': encodeFormParameter(_serializers, address, const FullType(String)),
        r'email': encodeFormParameter(_serializers, email, const FullType(String)),
        r'first_name': encodeFormParameter(_serializers, firstName, const FullType(String)),
        r'last_name': encodeFormParameter(_serializers, lastName, const FullType(String)),
        r'gender': encodeFormParameter(_serializers, gender, const FullType(String)),
        r'phone': encodeFormParameter(_serializers, phone, const FullType(String)),
        r'image': MultipartFile.fromBytes(image!, filename: r'image'),
        if (isAgePublic != null) r'isAgePublic': encodeFormParameter(_serializers, isAgePublic, const FullType(bool)),
        r'contribution': encodeFormParameter(_serializers, contribution, const FullType(int)),
        r'deviceToken': encodeFormParameter(_serializers, deviceToken, const FullType(String)),
        r'location': encodeFormParameter(_serializers, location, const FullType(String)),
        if (status != null) r'status': encodeFormParameter(_serializers, status, const FullType(bool)),
        r'verification_token': encodeFormParameter(_serializers, verificationToken, const FullType(String)),
        if (groups != null) r'groups': encodeFormParameter(_serializers, groups, const FullType(BuiltList, [FullType(int)])),
        if (userPermissions != null) r'user_permissions': encodeFormParameter(_serializers, userPermissions, const FullType(BuiltList, [FullType(int)])),
      };

    } catch(error) {
      throw DioError(
         requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
        ),
        type: DioErrorType.other,
        error: error,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    User _responseData;

    try {
      const _responseType = FullType(User);
      _responseData = _serializers.deserialize(
        _response.data!,
        specifiedType: _responseType,
      ) as User;

    } catch (error) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      );
    }

    return Response<User>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// 
  ///
  /// 
  Future<Response<void>> usersDelete({ 
    required int id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/users/{id}/'.replaceAll('{' r'id' '}', id.toString());
    final _options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'name': 'Basic',
          },
        ],
        ...?extra,
      },
      contentType: [
        'application/json',
      ].first,
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return _response;
  }

  /// 
  ///
  /// 
  Future<Response<InlineResponse2003>> usersList({ 
    int? limit,
    int? offset,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/users/';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'name': 'Basic',
          },
        ],
        ...?extra,
      },
      contentType: [
        'application/json',
      ].first,
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (limit != null) r'limit': limit,
      if (offset != null) r'offset': offset,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    InlineResponse2003 _responseData;

    try {
      const _responseType = FullType(InlineResponse2003);
      _responseData = _serializers.deserialize(
        _response.data!,
        specifiedType: _responseType,
      ) as InlineResponse2003;

    } catch (error) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      );
    }

    return Response<InlineResponse2003>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// 
  ///
  /// 
  Future<Response<LoginResponse>> usersLoginCreate({ 
    required Login data,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/users/login';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'name': 'Basic',
          },
        ],
        ...?extra,
      },
      contentType: [
        'application/json',
      ].first,
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
    };

    dynamic _bodyData;

    try {
      const _type = FullType(Login);
      _bodyData = _serializers.serialize(data, specifiedType: _type);

    } catch(error) {
      throw DioError(
         requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
        ),
        type: DioErrorType.other,
        error: error,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    LoginResponse _responseData;

    try {
      const _responseType = FullType(LoginResponse);
      _responseData = _serializers.deserialize(
        _response.data!,
        specifiedType: _responseType,
      ) as LoginResponse;

    } catch (error) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      );
    }

    return Response<LoginResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// 
  ///
  /// 
  Future<Response<void>> usersLogoutCreate({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/users/logout';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'name': 'Basic',
          },
        ],
        ...?extra,
      },
      contentType: [
        'application/json',
      ].first,
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return _response;
  }

  /// 
  ///
  /// 
  Future<Response<User>> usersPartialUpdate({ 
    required String password,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required int id,
    DateTime? lastLogin,
    bool? isSuperuser,
    bool? isStaff,
    bool? isActive,
    DateTime? dateJoined,
    int? age,
    String? address,
    String? gender,
    String? phone,
    Uint8List? image,
    bool? isAgePublic,
    int? contribution,
    String? deviceToken,
    String? location,
    bool? status,
    String? verificationToken,
    BuiltSet<int>? groups,
    BuiltSet<int>? userPermissions,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/users/{id}/'.replaceAll('{' r'id' '}', id.toString());
    final _options = Options(
      method: r'PATCH',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'name': 'Basic',
          },
        ],
        ...?extra,
      },
      contentType: [
        'application/x-www-form-urlencoded',
        'multipart/form-data',
      ].first,
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
    };

    dynamic _bodyData;

    try {
      _bodyData = <String, dynamic>{
        r'password': encodeFormParameter(_serializers, password, const FullType(String)),
        r'last_login': encodeFormParameter(_serializers, lastLogin, const FullType(DateTime)),
        if (isSuperuser != null) r'is_superuser': encodeFormParameter(_serializers, isSuperuser, const FullType(bool)),
        r'username': encodeFormParameter(_serializers, username, const FullType(String)),
        if (isStaff != null) r'is_staff': encodeFormParameter(_serializers, isStaff, const FullType(bool)),
        if (isActive != null) r'is_active': encodeFormParameter(_serializers, isActive, const FullType(bool)),
        if (dateJoined != null) r'date_joined': encodeFormParameter(_serializers, dateJoined, const FullType(DateTime)),
        r'age': encodeFormParameter(_serializers, age, const FullType(int)),
        r'address': encodeFormParameter(_serializers, address, const FullType(String)),
        r'email': encodeFormParameter(_serializers, email, const FullType(String)),
        r'first_name': encodeFormParameter(_serializers, firstName, const FullType(String)),
        r'last_name': encodeFormParameter(_serializers, lastName, const FullType(String)),
        r'gender': encodeFormParameter(_serializers, gender, const FullType(String)),
        r'phone': encodeFormParameter(_serializers, phone, const FullType(String)),
        r'image': MultipartFile.fromBytes(image!, filename: r'image'),
        if (isAgePublic != null) r'isAgePublic': encodeFormParameter(_serializers, isAgePublic, const FullType(bool)),
        r'contribution': encodeFormParameter(_serializers, contribution, const FullType(int)),
        r'deviceToken': encodeFormParameter(_serializers, deviceToken, const FullType(String)),
        r'location': encodeFormParameter(_serializers, location, const FullType(String)),
        if (status != null) r'status': encodeFormParameter(_serializers, status, const FullType(bool)),
        r'verification_token': encodeFormParameter(_serializers, verificationToken, const FullType(String)),
        if (groups != null) r'groups': encodeFormParameter(_serializers, groups, const FullType(BuiltList, [FullType(int)])),
        if (userPermissions != null) r'user_permissions': encodeFormParameter(_serializers, userPermissions, const FullType(BuiltList, [FullType(int)])),
      };

    } catch(error) {
      throw DioError(
         requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
        ),
        type: DioErrorType.other,
        error: error,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    User _responseData;

    try {
      const _responseType = FullType(User);
      _responseData = _serializers.deserialize(
        _response.data!,
        specifiedType: _responseType,
      ) as User;

    } catch (error) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      );
    }

    return Response<User>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// 
  ///
  /// 
  Future<Response<User>> usersRead({ 
    required int id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/users/{id}/'.replaceAll('{' r'id' '}', id.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'name': 'Basic',
          },
        ],
        ...?extra,
      },
      contentType: [
        'application/json',
      ].first,
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    User _responseData;

    try {
      const _responseType = FullType(User);
      _responseData = _serializers.deserialize(
        _response.data!,
        specifiedType: _responseType,
      ) as User;

    } catch (error) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      );
    }

    return Response<User>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// 
  ///
  /// 
  Future<Response<VerifyAccountResponse>> usersSendVerificationEmailCreate({ 
    required String email,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/users/send-verification-email/{email}/'.replaceAll('{' r'email' '}', email.toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'name': 'Basic',
          },
        ],
        ...?extra,
      },
      contentType: [
        'application/json',
      ].first,
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    VerifyAccountResponse _responseData;

    try {
      const _responseType = FullType(VerifyAccountResponse);
      _responseData = _serializers.deserialize(
        _response.data!,
        specifiedType: _responseType,
      ) as VerifyAccountResponse;

    } catch (error) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      );
    }

    return Response<VerifyAccountResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// 
  ///
  /// 
  Future<Response<User>> usersUpdate({ 
    required String password,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required int id,
    DateTime? lastLogin,
    bool? isSuperuser,
    bool? isStaff,
    bool? isActive,
    DateTime? dateJoined,
    int? age,
    String? address,
    String? gender,
    String? phone,
    Uint8List? image,
    bool? isAgePublic,
    int? contribution,
    String? deviceToken,
    String? location,
    bool? status,
    String? verificationToken,
    BuiltSet<int>? groups,
    BuiltSet<int>? userPermissions,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/users/{id}/'.replaceAll('{' r'id' '}', id.toString());
    final _options = Options(
      method: r'PUT',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'name': 'Basic',
          },
        ],
        ...?extra,
      },
      contentType: [
        'application/x-www-form-urlencoded',
        'multipart/form-data',
      ].first,
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
    };

    dynamic _bodyData;

    try {
      _bodyData = <String, dynamic>{
        r'password': encodeFormParameter(_serializers, password, const FullType(String)),
        r'last_login': encodeFormParameter(_serializers, lastLogin, const FullType(DateTime)),
        if (isSuperuser != null) r'is_superuser': encodeFormParameter(_serializers, isSuperuser, const FullType(bool)),
        r'username': encodeFormParameter(_serializers, username, const FullType(String)),
        if (isStaff != null) r'is_staff': encodeFormParameter(_serializers, isStaff, const FullType(bool)),
        if (isActive != null) r'is_active': encodeFormParameter(_serializers, isActive, const FullType(bool)),
        if (dateJoined != null) r'date_joined': encodeFormParameter(_serializers, dateJoined, const FullType(DateTime)),
        r'age': encodeFormParameter(_serializers, age, const FullType(int)),
        r'address': encodeFormParameter(_serializers, address, const FullType(String)),
        r'email': encodeFormParameter(_serializers, email, const FullType(String)),
        r'first_name': encodeFormParameter(_serializers, firstName, const FullType(String)),
        r'last_name': encodeFormParameter(_serializers, lastName, const FullType(String)),
        r'gender': encodeFormParameter(_serializers, gender, const FullType(String)),
        r'phone': encodeFormParameter(_serializers, phone, const FullType(String)),
        r'image': MultipartFile.fromBytes(image!, filename: r'image'),
        if (isAgePublic != null) r'isAgePublic': encodeFormParameter(_serializers, isAgePublic, const FullType(bool)),
        r'contribution': encodeFormParameter(_serializers, contribution, const FullType(int)),
        r'deviceToken': encodeFormParameter(_serializers, deviceToken, const FullType(String)),
        r'location': encodeFormParameter(_serializers, location, const FullType(String)),
        if (status != null) r'status': encodeFormParameter(_serializers, status, const FullType(bool)),
        r'verification_token': encodeFormParameter(_serializers, verificationToken, const FullType(String)),
        if (groups != null) r'groups': encodeFormParameter(_serializers, groups, const FullType(BuiltList, [FullType(int)])),
        if (userPermissions != null) r'user_permissions': encodeFormParameter(_serializers, userPermissions, const FullType(BuiltList, [FullType(int)])),
      };

    } catch(error) {
      throw DioError(
         requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
        ),
        type: DioErrorType.other,
        error: error,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    User _responseData;

    try {
      const _responseType = FullType(User);
      _responseData = _serializers.deserialize(
        _response.data!,
        specifiedType: _responseType,
      ) as User;

    } catch (error) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      );
    }

    return Response<User>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// 
  ///
  /// 
  Future<Response<VerifyAccountResponse>> usersVerifyRead({ 
    required String email,
    required String token,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/users/verify/{email}/{token}'.replaceAll('{' r'email' '}', email.toString()).replaceAll('{' r'token' '}', token.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'name': 'Basic',
          },
        ],
        ...?extra,
      },
      contentType: [
        'application/json',
      ].first,
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    VerifyAccountResponse _responseData;

    try {
      const _responseType = FullType(VerifyAccountResponse);
      _responseData = _serializers.deserialize(
        _response.data!,
        specifiedType: _responseType,
      ) as VerifyAccountResponse;

    } catch (error) {
      throw DioError(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioErrorType.other,
        error: error,
      );
    }

    return Response<VerifyAccountResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
