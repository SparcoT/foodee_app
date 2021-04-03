import 'package:foodee/src/data/local_data.dart';

 class AppData with LocalData{
  static Future<void> initialize() async {
    await LocalData.initialize();
    // await AppAuthData.initiate();
  }

// static final auth = AppAuthData._();
}
