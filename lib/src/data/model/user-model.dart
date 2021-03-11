import 'package:hive/hive.dart';
import 'package:foodee/src/data/_type_ids.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user-model.g.dart';

@JsonSerializable()
@HiveType(typeId: TypeIds.user)
class User extends HiveObject {
  @HiveField(21)
  int id;

  @HiveField(0)
  String username;

  @HiveField(1)
  String email;

  @HiveField(2)
  String password;

  @HiveField(3)
  double lat;

  @HiveField(4)
  double lang;

  @HiveField(5)
  @JsonKey(name: 'device_token')
  String deviceToken;

  @HiveField(6)
  String timezone;

  @HiveField(7)
  @JsonKey(name: 'email_confirm')
  int emailConfirm;

  @HiveField(8)
  String phone;

  @HiveField(9)
  String message;

  @HiveField(10)
  String interest;

  @HiveField(11)
  String ages;

  @HiveField(12)
  int age;

  @HiveField(13)
  @JsonKey(name: 'min_age')
  int minAge;

  @HiveField(14)
  @JsonKey(name: 'max_age')
  int maxAge;

  @HiveField(15)
  @JsonKey(name: 'is_age_private')
  int isAgePrivate;

  @HiveField(16)
  String gender;

  @HiveField(17)
  String contribution;

  @HiveField(18)
  String avatar;

  @HiveField(19)
  String cover;

  @HiveField(20)
  String address;

  User({
    this.id,
    this.age,
    this.ages,
    this.email,
    this.phone,
    this.cover,
    this.avatar,
    this.gender,
    this.interest,
    this.timezone,
    this.username,
    this.password,
    this.deviceToken,
    this.contribution,
    this.emailConfirm,
    this.isAgePrivate,this.address
  });

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  // Map<String, dynamic> toJson() => _$UserToJson(this);
}
