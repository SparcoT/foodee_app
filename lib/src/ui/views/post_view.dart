import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/constants.dart';
import 'package:foodee/src/base/nav.dart';
import 'package:foodee/src/ui/widgets/post_widget.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';
import 'package:openapi/openapi.dart';

class PostView extends StatelessWidget {
  // Future _getData() async => await _fetchData();
  //
  // Future<Response<InlineResponse2002>> _fetchData() async =>
  //     Openapi().getFeedsApi().feedsList(limit: 10);
Widget widget;
PostView({this.widget});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

           SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: ShaderText(
              shaderText: "Foodee",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Colors.purple,
                ),
                onPressed: () =>
                    AppNavigation.toPage(context, AppPage.notificationPage),
              ),
            ],
          ),

        SliverFillRemaining(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, i) {
              var u = FeedUserBuilder();
              u..firstName = 'Clark';
              u..lastName='Last';
              u..image='https://images.unsplash.com/photo-1586923109404-7bd976ed3e52?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
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
          ),
        ),
        // SliverFillRemaining(
        //   child: RefreshIndicator(
        //     onRefresh: _getData,
        //     child: FutureBuilder(
        //       future: _fetchData(),
        //       builder: (ctx, AsyncSnapshot<Response<InlineResponse2002>> post) {
        //         if (post.data == null)
        //           return Center(
        //             child: CircularProgressIndicator(),
        //           );
        //         else
        //           return ListView.builder(
        //             itemCount: post.data.data.results.length,
        //             itemBuilder: (context, i) {
        //               return Hero(
        //                 tag: kPostTag,
        //                 child: PostWidget(
        //                   feed: post.data.data.results[i],
        //                 ),
        //               );
        //             },
        //           );
        //       },
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
