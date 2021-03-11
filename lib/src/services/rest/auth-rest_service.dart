// import 'package:dio/dio.dart';
// import 'package:foodee/src/base/env.dart';
// import 'package:foodee/src/data/model/auth-data_model.dart';
// import 'package:foodee/src/data/model/user-model.dart';
// import 'package:foodee/src/services/rest/_client.dart';
//
// part 'auth-rest_service.g.dart';
//
// @RestApi(baseUrl: AppEnv.apiUrl)
// abstract class AuthRestService {
//   factory AuthRestService() => _AuthRestService(dioClient);
//
//   @GET('/auth/user')
//   Future<User> getUser();
//
//   @POST('/user')
//   Future<User> postUser(@Body() User v);
//
//   @GET('/resend-verification-email/{email}')
//   Future<String> resendEmail({@Path() String email});
//
//   @POST('/forgot-password/{email}')
//   Future<dynamic> forgotPassword({@Path() String email});
//
//   @POST('/login')
//   Future<AuthData> signIn(@Body() AuthRequest data);
//
//   @DELETE('/user/{id}')
//   Future<User> deleteUser(@Path() int id);
// }
