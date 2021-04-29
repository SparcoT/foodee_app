import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodee/src/base/assets.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/data/data.dart';
import 'package:foodee/src/services/lazy-task_service.dart';
import 'package:foodee/src/ui/pages/near-by/near-by_model.dart';
import 'package:foodee/src/ui/widgets/post_widget.dart';
import 'package:openapi/openapi.dart';
import 'package:built_collection/built_collection.dart';

class PostDetailPage extends StatefulWidget {
  final NearByModel nearByModel;
  final String url;
  final Feed feed;

  PostDetailPage({
    this.url,
    this.nearByModel,
    this.feed,
  });

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final _commentsController = TextEditingController();

  Future _getData() async => await _fetchComments();

  Future<Response<BuiltList<FeedComment>>> _fetchComments() =>
      Openapi().getFeedsApi().feedsCommentsList(id: widget.feed.id.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CupertinoNavigationBar(
        middle: Text('Detail'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Hero(
              tag: widget.feed.id,
              child: PostWidget(
                isDetail: true,
                feed: widget.feed,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Color(0xfff6f6f6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.chevron_up,
                      color: AppTheme.secondaryColor,
                    ),
                    label: Text(
                      'Previous',
                      style: TextStyle(
                        color: AppTheme.secondaryColor,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      AppAssets.doubleArrow,
                      color: AppTheme.secondaryColor,
                      width: 30,
                    ),
                    label: Text(
                      'Oldest',
                      style: TextStyle(
                        color: AppTheme.secondaryColor,
                        // fontFamily: 'MazzardHBlack',
                        // fontSize: 15,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: RefreshIndicator(
              onRefresh: _getData,
              child: FutureBuilder(
                future: _fetchComments(),
                builder: (ctx,
                    AsyncSnapshot<Response<BuiltList<FeedComment>>> comments) {
                  if (comments.data == null)
                    return Align(
                      alignment: Alignment.topCenter,
                      child: CupertinoActivityIndicator(),
                    );
                  else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: comments.data.data.length,
                      itemBuilder: (ctx, index) {
                        return CommentRow(
                          comment: comments.data.data.elementAt(index),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 80,
              color: Color(0xfff6f6f6),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  controller: _commentsController,
                  decoration: InputDecoration(
                    hintText: 'Type here something...',
                    hintStyle: TextStyle(
                      fontSize: 13,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            SizedBox(
              width: 40,
              height: 40,
              child: TextButton(
                onPressed: _addComment,
                child: SvgPicture.asset(
                  AppAssets.send,
                  color: Colors.white,
                  width: 23,
                ),
                style: TextButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.zero,
                  backgroundColor: AppTheme.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _addComment() async {
    print(widget.feed.id);
    print(AppData().getUserId());
    if (_commentsController.text.isNotEmpty) {
      final _comment = _commentsController.text;
      final _result = await LazyTaskService.execute<Response<FeedComment>>(
              context, () async {
        return Openapi().getFeedsApi().feedsCreateCommentsCreate(
          data: FeedCommentWrite(
            (feedComment) {
              feedComment
                ..description = _comment
                ..user = AppData().getUserId()
                ..post = widget.feed.id;
            },
          ),
        );
      }, throwError: true)
          .catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No Internet Connection'),
          ),
        );
      });
      if (_result != null) {
        _commentsController.text = '';
        setState(() {});
      }
    }
  }
}

class CommentRow extends StatefulWidget {
  final FeedComment comment;

  CommentRow({
    this.comment,
  });

  @override
  _CommentRowState createState() => _CommentRowState();
}

class _CommentRowState extends State<CommentRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff6f6f6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(left: 20.0, right: 30),
            leading: Container(
              width: 47,
              height: 47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                image: DecorationImage(
                  image: widget.comment.user.image.isNotEmpty
                      ? NetworkImage(
                          '${Openapi.basePath}${widget.comment.user.image}')
                      : AssetImage(AppAssets.user),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                widget.comment.user.firstName,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'MazzardHBold',
                ),
              ),
            ),
            subtitle: Text(
              '${widget.comment.createdAt.toString()} Hours',
              style: TextStyle(
                fontSize: 11,
                fontFamily: 'MazzardHExtraLight',
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 82, right: 20),
            child: Text(
              widget.comment.description,
              style: TextStyle(
                fontFamily: 'MazzardHExtraLight',
                fontWeight: FontWeight.bold,
                fontSize: 12.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
