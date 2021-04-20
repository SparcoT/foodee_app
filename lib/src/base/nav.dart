import 'package:flutter/cupertino.dart';
import 'package:foodee/src/data/data.dart';
import 'package:foodee/src/ui/pages/auth/sign-in_page.dart';
import 'package:foodee/src/ui/pages/home_page.dart';
import 'package:foodee/src/ui/pages/posts/create-post_page.dart';

class AppPage {
  final String _name;

  const AppPage._(this._name);

  static const home = AppPage._('/');
  static const signIn = AppPage._('/sign-in');
  static const signUp = AppPage._('/sign-up');
  static const createPost = AppPage._('/create-post');
}

abstract class AppNavigation {
  static Future<void> to(BuildContext context, Widget page,
      {bool replace = false}) {
    if (replace) {
      return Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => page,
      ));
    } else {
      return Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => page,
      ));
    }
  }

  static Future<void> toPage(BuildContext context, AppPage page) {
    return Navigator.of(context).pushNamed(page._name);
  }

  /// Warning: use this method only if the navigation stack has [FoodeeHomePage] in it
  /// otherwise all the pages will be removed from the [Navigator] stack and you
  /// will see a black screen.
  static void backToHome(BuildContext context) => Navigator.of(context)
      .popUntil((route) => route.settings.name == AppPage.home._name);

  static final routes = <String, WidgetBuilder>{
    AppPage.home._name: (context) =>
        AppData().hasData() ? HomePage() : SignInPage(),
    // AppPage.home._name: (context) =>
    //     AppData.auth.isAuthenticated ? Container() : SignInPage(),
    //AppData.auth.isAuthenticated ? Container() : Transaction(),

    AppPage.createPost._name: (context) => CreatePostPage(),
    // SignInPage()
  };
}
