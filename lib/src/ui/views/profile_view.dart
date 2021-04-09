import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/constants.dart';
import 'package:foodee/src/base/nav.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/data/data.dart';
import 'package:foodee/src/services/lazy-task_service.dart';
import 'package:foodee/src/settingPage.dart';
import 'package:foodee/src/ui/modals/information_dialog.dart';
import 'package:foodee/src/ui/pages/auth/edit-profile_page.dart';
import 'package:foodee/src/ui/pages/image-models.dart';
import 'package:foodee/src/ui/pages/posts/post-detail_page.dart';
import 'package:foodee/src/ui/widgets/post_widget.dart';
import 'package:openapi/openapi.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  var currentIndex = 0;

  PageController pageController;
  TabController _tabController;
  OverlayEntry _overlayEntry;

  // final _scrollController = ScrollController();
  // final _layerLink = LayerLink();
  // final _overlayWidget = SizedBox(
  //   width: 80,
  //   height: 80,
  //   child: CircleAvatar(
  //     backgroundImage: NetworkImage(
  //       'https://static.toiimg.com/photo/msid-71581763/71581763.jpg?259859',
  //     ),
  //   ),
  // );

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    _tabController = TabController(length: 4, vsync: this);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _scrollController.addListener(() {
    //     this._overlayEntry = _createOverlayEntry();
    //     Overlay.of(context).insert(_overlayEntry);
    // });
    // });
  }

  // OverlayEntry _createOverlayEntry() {
  //   RenderBox renderBox = context.findRenderObject();
  //   // var size = renderBox.size;
  //   return OverlayEntry(
  //     builder: (ctx) {
  //       return Positioned(
  //         child: CompositedTransformFollower(
  //           link: _layerLink,
  //           showWhenUnlinked: false,
  //           offset: Offset(0.0, 0.0 + 5.0),
  //           // link: this._,
  //           child: _overlayWidget,
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    // _scrollController.dispose();
    // this._overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      // controller: _scrollController,
      key: UniqueKey(),
      headerSliverBuilder: (BuildContext context, bool isBox) {
        return [
          SliverAppBar(
            stretch: true,
            pinned: true,
            expandedHeight: 230,
            title: Row(children: [
              Spacer(),
              Container(
                width: 45,
                height: 45,
                clipBehavior: Clip.hardEdge,
                child: BackdropFilter(
                  child: Icon(Icons.settings),
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black54, width: 2),
                ),
              ),
            ]),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
              background: Expanded(
                child: Image.network(
                  'https://static.toiimg.com/photo/msid-71581763/71581763.jpg?259859',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ];
      },
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                followersWidget(),
                rowWidget(),
                richTextWidget(),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: tabs()),
          SliverFillRemaining(child: Expanded(child: pageViews()))
        ],
      ),
    );
  }

  Widget imageContainerWidget() {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.none,
          constraints: BoxConstraints.expand(height: 230),
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://static.toiimg.com/photo/msid-71581763/71581763.jpg?259859',
              ),
            ),
          ),
          // child:
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        )
      ],
    );
  }

  Widget followersWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          textContainer(text: "24.2k", textFollow: "Follower"),
          SizedBox(),
          textContainer(text: "100", textFollow: "Following"),
        ],
      ),
    );
  }

  Widget rowWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: textBold(text: 'Priscilla'),
          ),
          Container(
              height: 25,
              child: VerticalDivider(
                thickness: 2,
                color: Colors.grey,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: textBold(text: 'Design'),
          ),
        ],
      ),
    );
  }

  Widget richTextWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'I believe that to be distinctive,inspiring and \n innovative ',
          style: TextStyle(color: Colors.grey, fontSize: 13),
          children: <TextSpan>[
            TextSpan(
              text: '@Behance',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }

  Widget textBold({String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget textContainer({String text, String textFollow}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            textFollow,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  Widget tabs() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textButton(
            index: 0,
            icon: Icons.person_add,
            onPressed: () {
              setState(() {
                currentIndex = 0;
              });
              pageController.animateToPage(
                0,
                duration: Duration(milliseconds: 200),
                curve: Curves.bounceIn,
              );
            },
          ),
          textButton(
            index: 1,
            icon: Icons.settings,
            onPressed: () {
              setState(() {
                currentIndex = 1;
              });
              pageController.animateToPage(
                1,
                duration: Duration(milliseconds: 200),
                curve: Curves.bounceIn,
              );
            },
          ),
          textButton(
            index: 2,
            icon: Icons.edit,
            onPressed: () {
              setState(() {
                currentIndex = 2;
              });
              pageController.animateToPage(
                2,
                duration: Duration(milliseconds: 200),
                curve: Curves.bounceIn,
              );
            },
          ),
          textButton(
            index: 2,
            icon: Icons.exit_to_app,
            onPressed: () async {
              final _result =
                  await LazyTaskService.execute<Response<dynamic>>(
                context,
                () async {
                  return Openapi().getUsersApi().usersLogoutCreate();
                },
                throwError: true,
              ).catchError((e) {
                print('=== === === === === === === === ===');
                print(e);
                var errorMessage = 'No Internet Connection';
                if (e?.response?.data != null)
                  errorMessage = e.response.data['message'];
                openInfoDialog(
                  context: context,
                  title: 'Warning',
                  content: errorMessage,
                );
              });
              if (_result != null) {
                print('===Message===');
                print(_result);
                if (_result.statusCode == 200) {
                  await AppData().clearData();
                  Navigator.of(context).pop();
                  AppNavigation.toPage(context, AppPage.home);
                }
              }
            },
          ),
          // textButton(
          //     index: 3,
          //     icon: Icons.notifications,
          //     onPressed: () {
          //       setState(() {
          //         currentIndex = 3;
          //       });
          //
          //       pageController.animateToPage(3,
          //           duration: Duration(milliseconds: 200),
          //           curve: Curves.bounceIn);
          //     }),
          // Container(width: MediaQuery.of(context).size.width,
        ],
      ),
    );
  }

  Widget pageViews() {
    return PageView(
      controller: pageController,
      ///controller: _tabController,
      children: [
        ListView.builder(
          itemBuilder: (ctx, index) {
            return Hero(
              tag: kPostTag,
              child: PostWidget(
                url: imageModel[index].url,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) => PostDetailPage(
                        url: imageModel[index].url,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          itemCount: imageModel.length,
        ),
        SettingPage(),
        EditProfile(),
        // NotificationsPage(),
      ],
    );
  }

  Widget textButton({
    IconData icon,
    Function onPressed,
    int index,
  }) {
    return TextButton(
      child: Icon(
        icon,
        color: index == currentIndex ? Colors.white : Colors.black,
      ),
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor:
              index == currentIndex ? AppTheme.primaryColor : Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}
