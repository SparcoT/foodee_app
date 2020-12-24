import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodee/src/services/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'base/theme.dart';
import 'data/data.dart';
import 'base/nav.dart';

class App extends StatelessWidget {
  static const name = 'Foodee';

  static Future<void> initializeAndRun() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppServices.initialize();
    await AppData.initialize();

    runApp(App());
  }

  @override
  Widget build(BuildContext context) {
    AppServices.bindUiContext(context);

    return Theme(
      data: AppTheme.data,
      child: CupertinoApp(
        title: name,
        routes: AppNavigation.routes,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    );
  }
}
