import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/nav.dart';
import 'package:foodee/src/ui/pages/posts/post-detail_page.dart';
import 'package:foodee/src/ui/views/paginated_view.dart';
import 'package:foodee/src/ui/widgets/post_widget.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';
import 'package:openapi/openapi.dart';

class PostView extends StatelessWidget {
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
          child: PaginatedView<Feed>(
            restAction: (a, b) async {
              // final result = await Openapi().getFeedsApi().feedsList(limit: 10);
              // print(result.data);
              // return [];
              return (await Openapi().getFeedsApi().feedsList(limit: a, offset: b))
                    .data
                    .results
                    .toList();
            },
            builder: (ctx, data) {
              return Hero(
                tag: data.id,
                child: PostWidget(
                  feed: data,
                  onTap: () {
                    AppNavigation.to(
                      context,
                      PostDetailPage(
                        feed: data,
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
