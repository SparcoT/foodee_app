import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for User
void main() {
  final instance = UserBuilder();
  // TODO add properties to the builder and call build()

  group(User, () {
    // int id
    test('to test the property `id`', () async {
      // TODO
    });

    // String password
    test('to test the property `password`', () async {
      // TODO
    });

    // DateTime lastLogin
    test('to test the property `lastLogin`', () async {
      // TODO
    });

    // Designates that this user has all permissions without explicitly assigning them.
    // bool isSuperuser
    test('to test the property `isSuperuser`', () async {
      // TODO
    });

    // Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.
    // String username
    test('to test the property `username`', () async {
      // TODO
    });

    // Designates whether the user can log into this admin site.
    // bool isStaff
    test('to test the property `isStaff`', () async {
      // TODO
    });

    // Designates whether this user should be treated as active. Unselect this instead of deleting accounts.
    // bool isActive
    test('to test the property `isActive`', () async {
      // TODO
    });

    // DateTime dateJoined
    test('to test the property `dateJoined`', () async {
      // TODO
    });

    // int age
    test('to test the property `age`', () async {
      // TODO
    });

    // String address
    test('to test the property `address`', () async {
      // TODO
    });

    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // String firstName
    test('to test the property `firstName`', () async {
      // TODO
    });

    // String lastName
    test('to test the property `lastName`', () async {
      // TODO
    });

    // String gender
    test('to test the property `gender`', () async {
      // TODO
    });

    // String phone
    test('to test the property `phone`', () async {
      // TODO
    });

    // String image
    test('to test the property `image`', () async {
      // TODO
    });

    // bool isAgePublic
    test('to test the property `isAgePublic`', () async {
      // TODO
    });

    // int contribution
    test('to test the property `contribution`', () async {
      // TODO
    });

    // String deviceToken
    test('to test the property `deviceToken`', () async {
      // TODO
    });

    // String location
    test('to test the property `location`', () async {
      // TODO
    });

    // bool status
    test('to test the property `status`', () async {
      // TODO
    });

    // String verificationToken
    test('to test the property `verificationToken`', () async {
      // TODO
    });

    // The groups this user belongs to. A user will get all permissions granted to each of their groups.
    // BuiltSet<int> groups
    test('to test the property `groups`', () async {
      // TODO
    });

    // Specific permissions for this user.
    // BuiltSet<int> userPermissions
    test('to test the property `userPermissions`', () async {
      // TODO
    });

  });
}
