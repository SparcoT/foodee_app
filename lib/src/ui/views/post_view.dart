import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/nav.dart';
import 'package:foodee/src/ui/pages/posts/post-detail_page.dart';
import 'package:foodee/src/ui/views/paginated_view.dart';
import 'package:foodee/src/ui/widgets/post_widget.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';
import 'package:openapi/openapi.dart';

class PostView extends StatelessWidget {
  final controller =
      PaginatedViewController<Feed>(restAction: (a, b, s) async {
    return (await Openapi().getFeedsApi().feedsList(limit: a, offset: b))
        .data
        .results
        .toList();
  });

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

        /// onChanged((str) {
        ///   controller.search = str;
        /// });

        SliverFillRemaining(
          child: PaginatedView<Feed>(
            controller: controller,
            builder: (context, feed) {
              return Hero(
                tag: feed.id,
                child: PostWidget(
                  feed: feed,
                  onTap: () {
                    AppNavigation.to(
                      context,
                      PostDetailPage(
                        feed: feed,
                      ),
                    );
                    print('Tap');
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
