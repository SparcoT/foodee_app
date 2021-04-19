import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/constants.dart';
import 'package:foodee/src/ui/pages/image-models.dart';
import 'package:foodee/src/ui/widgets/post_widget.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';
import 'package:openapi/openapi.dart';
import 'package:openapi/src/model/inline_response2002.dart';

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
              onPressed: () {},
            )
          ],
        ),
        SliverFillRemaining(
          child: FutureBuilder(
            future: Openapi().getFeedsApi().feedsList(
                  limit: 10,
                ),
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
      ],
    );
    Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Container(
            child: ListTile(
              title: Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: ShaderText(
                    shaderText: "Foodee",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              trailing: IconButton(
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Colors.purple,
                ),
                onPressed: () {},
              ),
            ),
          ),
          preferredSize: Size.fromHeight(10.0),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(itemBuilder: (context, i) {
        return Hero(
            tag: kPostTag,
            child: PostWidget(
              // url: imageModel[i].url,
            ));
      }),
    );
  }
}
