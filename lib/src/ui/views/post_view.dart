import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/constants.dart';
import 'package:foodee/src/ui/widgets/post_widget.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';
import 'package:openapi/openapi.dart';

class PostView extends StatelessWidget {
  Future _getData() async => await _fetchData();

  Future<Response<InlineResponse2002>> _fetchData() async =>
      Openapi().getFeedsApi().feedsList(limit: 10);

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
              onPressed: () {},
            )
          ],
        ),
        SliverFillRemaining(
          child: RefreshIndicator(
            onRefresh: _getData,
            child: FutureBuilder(
              future: _fetchData(),
              builder: (ctx, AsyncSnapshot<Response<InlineResponse2002>> post) {
                if (post.data == null)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return ListView.builder(
                    itemCount: post.data.data.results.length,
                    itemBuilder: (context, i) {
                      return Hero(
                        tag: kPostTag,
                        child: PostWidget(
                          feed: post.data.data.results[i],
                        ),
                      );
                    },
                  );
              },
            ),
          ),
        ),
      ],
    );
  }
}
