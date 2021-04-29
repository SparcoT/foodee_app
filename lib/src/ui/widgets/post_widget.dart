import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/assets.dart';
import 'package:foodee/src/data/data.dart';
import 'package:foodee/src/ui/widgets/like-button_widget.dart';
import 'package:openapi/openapi.dart';

class PostWidget extends StatefulWidget {
  final bool isDetail;

  // String url;
  final Function onTap;
  final Feed feed;

  PostWidget({
    this.isDetail = false,
    // this.url,
    this.onTap,
    this.feed,
  });

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  var _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SizedBox(
        height: widget.feed?.images?.isNotEmpty ?? false ? 340 : 135,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: widget.onTap,
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 20.0, right: 30),
                leading: Container(
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    image: DecorationImage(
                      image: widget.feed?.user?.image?.isNotEmpty ?? false
                          ? NetworkImage(
                              widget.feed.user.image,
                            )
                          : AssetImage(AppAssets.user),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    // 'Name',
                    widget.feed?.user?.firstName ?? 'Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'MazzardHBold',
                    ),
                  ),
                ),
                subtitle: Text(
                  widget.feed.description,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'MazzardHExtraLight',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: widget.feed.user.id == AppData().getUserId()
                    ? GestureDetector(
                        child: Image.asset(
                          AppAssets.more,
                          width: 22,
                        ),
                        onTap: () {},
                      )
                    : null,
              ),
            ),
            if (widget.feed?.images?.isNotEmpty ?? false)
              Container(
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.feed.images.first,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 5, 5),
              child: Row(
                children: [
                  LikeButtonWidget(
                    onChanged: (value) => _isFavourite = value,
                    isFavourite: _isFavourite,
                  ),
                  Text(widget.feed.likesCount.toString()),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 5),
                    child: GestureDetector(
                      onTap: widget.isDetail ? null : _onNextPage,
                      child: Icon(
                        CupertinoIcons.chat_bubble,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Text(widget.feed.commentsCount.toString()),
                ],
              ),
            ),
            // isDetail
            //     ? SizedBox(
            //         height: 20,
            //       )
            //     :
            if (!widget.isDetail)
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  _onNextPage() {
    // AppNavigation.to(_context, PostDetailPage());
  }
}
