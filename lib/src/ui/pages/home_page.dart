import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodee/src/base/assets.dart';
import 'package:foodee/src/base/nav.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/ui/views/friends-chat_view.dart';
import 'package:foodee/src/ui/views/post_view.dart';
import 'package:foodee/src/ui/views/profile_view.dart';
import 'package:web_socket_channel/io.dart';
import 'near-by/near-by.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _index = 0;
  var _viewItems = [
    PostView(),
    NearBy(),
    Text(''),
    FriendsChatView(),
    ProfileView(),
  ];
  String response;
  IOWebSocketChannel channel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _viewItems[_index],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 60,
            child: CupertinoTabBar(
              backgroundColor: Colors.white,
              border: Border(
                top: BorderSide(width: .04),
              ),
              onTap: _onTap,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _index == 0 ? AppAssets.homeDark : AppAssets.homeLight,
                    color: AppTheme.secondaryColor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _index == 1 ? AppAssets.searchDark : AppAssets.searchLight,
                    color: AppTheme.secondaryColor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _index == 3 ? AppAssets.chatDark : AppAssets.chatLight,
                    color: AppTheme.secondaryColor,
                    width: 22.5,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    _index == 4
                        ? CupertinoIcons.person_solid
                        : CupertinoIcons.person,
                    color: AppTheme.secondaryColor,
                    size: 26.5,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            right: (MediaQuery.of(context).size.width / 2) - 35,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, -3), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () => AppNavigation.toPage(context, AppPage.createPost),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.primaryColor,
                  ),
                  child: Image.asset(
                    AppAssets.camera,
                    color: Colors.white,
                    // width: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onTap(int index) {
    setState(() {
      _index = index;
    });
  }
}
