import 'package:foodee/src/data/_type_ids.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:foodee/src/data/model/user-model.dart';

part 'auth-data_model.g.dart';

@JsonSerializable()
@HiveType(typeId: TypeIds.auth)
class AuthData extends HiveObject {
  @HiveField(0)
  User user;

  @HiveField(1)
  String token;

  AuthData({this.user, this.token});

  // factory AuthData.fromJson(Map<String, dynamic> json) =>
  //     _$AuthDataFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}

@JsonSerializable()
class AuthRequest extends HiveObject {
  @JsonKey(name: 'email')
  String username;
  String password;

  AuthRequest({this.username, this.password});

  // factory AuthRequest.fromJson(Map<String, dynamic> json) =>
  //     _$AuthRequestFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
