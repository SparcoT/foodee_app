import 'package:foodee/src/data/model/auth-data_model.dart';
import 'package:foodee/src/services/rest/auth-rest_service.dart';
import 'package:foodee/src/services/rest/server_error.dart';
import 'package:foodee/src/services/services.dart';
import 'package:foodee/src/utils/lazy_task.dart';

mixin AuthServiceMixin {
  static final _authRestService = AuthRestService();

  void signIn(AuthRequest request) async {
    ServerError _error;
    var _result = await performLazyTask(AppServices.context, () async {
      await _authRestService.signIn(request).catchError((error) {
        // 401
        // 406

        _error = ServerError.withError(error);
      });
    });
  }
}
