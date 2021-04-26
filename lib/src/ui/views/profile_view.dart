import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/constants.dart';
import 'package:foodee/src/base/nav.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/settingPage.dart';
import 'package:foodee/src/ui/pages/auth/edit-profile_page.dart';
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

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      // controller: _scrollController,
      key: UniqueKey(),
      headerSliverBuilder: (BuildContext context, bool isBox) {
        return [
          SliverAppBar(
            backgroundColor: AppTheme.secondaryColor,
            stretch: true,
            pinned: true,
            expandedHeight: 230,
            // title: Row(children: [
            //   Spacer(),
            //   Container(
            //     width: 45,
            //     height: 45,
            //     clipBehavior: Clip.hardEdge,
            //     child: BackdropFilter(
            //       child: IconButton(
            //         icon: Icon(Icons.settings),
            //         onPressed: () {},
            //       ),
            //       filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            //     ),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(color: Colors.black54, width: 2),
            //     ),
            //   ),
            // ]),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
              background: Image.network(
                'https://static.toiimg.com/photo/msid-71581763/71581763.jpg?259859',
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              appBarIconButtonElevated(
                  icon: Icons.settings,
                  function: () {
                    AppNavigation.to(context, SettingPage());
                  }),
              SizedBox(
                width: 10,
              ),
              appBarIconButtonElevated(
                  icon: Icons.edit,
                  function: () {
                    AppNavigation.to(context, EditProfile());
                  }),
            ],
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
          // SliverToBoxAdapter(child: tabs()),
          SliverFillRemaining(child: PersonPostsView())
        ],
      ),
    );
  }

  Widget appBarIconButton({IconData icon, Function function}) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 45,
        height: 45,
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          child: Icon(icon),
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppTheme.secondaryColor, width: 2),
        ),
      ),
    );
  }

  Widget appBarIconButtonElevated({IconData icon, Function function})
  {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 45,
        child: Icon(icon),
        decoration: BoxDecoration(color: Colors.white24,
          // boxShadow: [ BoxShadow(blurRadius:1, spreadRadius: 4)],
           borderRadius: BorderRadius.circular(10),
        ),
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
              _tabController.animateTo(0);
              // pageController.animateToPage(
              //   0,
              //   duration: Duration(milliseconds: 200),
              //   curve: Curves.bounceIn,
              // );
            },
          ),
          textButton(
            index: 1,
            icon: Icons.settings,
            onPressed: () {
              setState(() {
                currentIndex = 1;
              });
              _tabController.animateTo(1);
              // _tabController.animateToPage(
              //   1,
              //   duration: Duration(milliseconds: 200),
              //   curve: Curves.bounceIn,
              // );
            },
          ),
          textButton(
            index: 2,
            icon: Icons.edit,
            onPressed: () {
              setState(() {
                currentIndex = 2;
              });
              _tabController.animateTo(2);
              // pageController.animateToPage(
              //
              //   2,
              //   duration: Duration(milliseconds: 200),
              //   curve: Curves.bounceIn,
              // );
            },
          ),
          textButton(index: 3, icon: Icons.exit_to_app, onPressed: () {}
              //     () async {
              //   final _result =
              //       await LazyTaskService.execute<Response<dynamic>>(
              //     context,
              //     () async {
              //       return Openapi().getUsersApi().usersLogoutCreate();
              //     },
              //     throwError: true,
              //   ).catchError((e) {
              //     print('=== === === === === === === === ===');
              //     print(e);
              //     var errorMessage = 'No Internet Connection';
              //     if (e?.response?.data != null)
              //       errorMessage = e.response.data['message'];
              //     openInfoDialog(
              //       context: context,
              //       title: 'Warning',
              //       content: errorMessage,
              //     );
              //   });
              //   if (_result != null) {
              //     print('===Message===');
              //     print(_result);
              //     if (_result.statusCode == 200) {
              //       await AppData().clearData();
              //       Navigator.of(context).pop();
              //       AppNavigation.toPage(context, AppPage.home);
              //     }
              //   }
              // },

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
    return TabBarView(
      controller: _tabController,
      children: [
        PersonPostsView(),
        SettingPage(),
        EditProfile(),
        Text("")
//        EditProfile(),
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

class PersonPostsView extends StatefulWidget {
  @override
  _PersonPostsViewState createState() => _PersonPostsViewState();
}

class _PersonPostsViewState extends State<PersonPostsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 100,
      itemBuilder: (context, i) {
        var u = FeedUserBuilder();
        u..firstName = 'Clark';
        u..lastName = 'Last';
        u
          ..image =
              'https://images.unsplash.com/photo-1586923109404-7bd976ed3e52?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
        return Hero(
          tag: kPostTag,
          child: PostWidget(
            feed: Feed((b) {
              b..description = 'Get out there and live a little';
              b..id = 1;
              b..user = u;
              b..likesCount = 1;
              b..commentsCount = 2;
              // b..images=[];
            }),
          ),
        );
      },
    );
  }
}
