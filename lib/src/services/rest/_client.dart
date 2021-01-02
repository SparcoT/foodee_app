import 'package:dio/dio.dart';
import 'package:foodee/src/base/env.dart';

final dioClient = Dio(
  BaseOptions(
    baseUrl: AppEnv.apiUrl,
    connectTimeout: 50000,
    receiveTimeout: 50000,
  ),
);
