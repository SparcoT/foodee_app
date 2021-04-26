import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for UsersApi
void main() {
  final instance = Openapi().getUsersApi();

  group(UsersApi, () {
    //Future<User> usersCreate(String password, String username, String email, String firstName, String lastName, { DateTime lastLogin, bool isSuperuser, bool isStaff, bool isActive, DateTime dateJoined, int age, String address, String gender, String phone, Uint8List image, bool isAgePublic, int contribution, String deviceToken, String location, bool status, String verificationToken, BuiltSet<int> groups, BuiltSet<int> userPermissions }) async
    test('test usersCreate', () async {
      // TODO
    });

    //Future usersDelete(int id) async
    test('test usersDelete', () async {
      // TODO
    });

    //Future<InlineResponse2003> usersList({ int limit, int offset }) async
    test('test usersList', () async {
      // TODO
    });

    //Future<LoginResponse> usersLoginCreate(Login data) async
    test('test usersLoginCreate', () async {
      // TODO
    });

    //Future usersLogoutCreate() async
    test('test usersLogoutCreate', () async {
      // TODO
    });

    //Future<User> usersPartialUpdate(String password, String username, String email, String firstName, String lastName, int id, { DateTime lastLogin, bool isSuperuser, bool isStaff, bool isActive, DateTime dateJoined, int age, String address, String gender, String phone, Uint8List image, bool isAgePublic, int contribution, String deviceToken, String location, bool status, String verificationToken, BuiltSet<int> groups, BuiltSet<int> userPermissions }) async
    test('test usersPartialUpdate', () async {
      // TODO
    });

    //Future<User> usersRead(int id) async
    test('test usersRead', () async {
      // TODO
    });

    //Future<VerifyAccountResponse> usersSendVerificationEmailCreate(String email) async
    test('test usersSendVerificationEmailCreate', () async {
      // TODO
    });

    //Future<User> usersUpdate(String password, String username, String email, String firstName, String lastName, int id, { DateTime lastLogin, bool isSuperuser, bool isStaff, bool isActive, DateTime dateJoined, int age, String address, String gender, String phone, Uint8List image, bool isAgePublic, int contribution, String deviceToken, String location, bool status, String verificationToken, BuiltSet<int> groups, BuiltSet<int> userPermissions }) async
    test('test usersUpdate', () async {
      // TODO
    });

    //Future<VerifyAccountResponse> usersVerifyRead(String email, String token) async
    test('test usersVerifyRead', () async {
      // TODO
    });

  });
}
