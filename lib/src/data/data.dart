import 'package:hive/hive.dart';
import 'model/user-model.dart';
import 'model/auth-data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'parts/auth_data.dart';

abstract class AppData {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    await AppAuthData.initiate();
  }

  static final auth = AppAuthData._();
}
