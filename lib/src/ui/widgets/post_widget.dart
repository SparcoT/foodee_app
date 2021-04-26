import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/assets.dart';
import 'package:foodee/src/base/nav.dart';
import 'package:foodee/src/ui/pages/posts/create-post_page.dart';
import 'package:foodee/src/ui/widgets/like-button_widget.dart';
import 'package:openapi/openapi.dart';

// ignore: must_be_immutable
class PostWidget extends StatelessWidget {
  final bool isDetail;

  // String url;
  Function onTap;
  Feed feed;

  PostWidget({
    this.isDetail = false,
    // this.url,
    this.onTap,
    this.feed,
  });

  var _isFavourite = false;

  @override
  Widget build(BuildContext context) {
//    final url =
    //       'https://images.pexels.com/photos/3236736/pexels-photo-3236736.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260';
    return SizedBox(
      height: 329,
      // height: feed?.images?.isNotEmpty ?? false ? 369 : 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: ListTile(
              // tileColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 20.0, right: 30),
              leading: Container(
                width: 47,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  image: DecorationImage(
                    image: feed?.user?.image?.isNotEmpty ?? false
                        ? NetworkImage(
                            feed.user.image,
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
                  feed?.user?.firstName ?? 'Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'MazzardHBold',
                  ),
                ),
              ),
              subtitle: Text(
                feed.description,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'MazzardHExtraLight',
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: PopupMenuButton(
                child: Icon(Icons.more_vert),
                itemBuilder: (_) => <PopupMenuItem>[
                  PopupMenuItem(
                      child: GestureDetector(
                          onTap: () {

                  AppNavigation.to(context, CreatePostPage());
                  print("Edit Pressed");

                            Navigator.of(context).pop();
                          },
                          child: Text('Edit'))),
                  PopupMenuItem(
                    child: GestureDetector(onTap: () {
                      print("Delete Pressed");

                    }, child: Text('Delete')),
                  ),
                ],
                onSelected: (_) {},
              ),

              // GestureDetector(
              //   child: Image.asset(
              //     AppAssets.more,
              //     width: 22,
              //   ),
              //   onTap: () {},
              // ),
            ),
          ),
          // if (feed?.images?.isNotEmpty ?? false)
          Container(
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1619023634328-d429c22a4957?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
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
                Text(feed.likesCount.toString()),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5),
                  child: GestureDetector(
                    onTap: isDetail ? null : _onNextPage,
                    child: Icon(
                      CupertinoIcons.chat_bubble,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(feed.commentsCount.toString()),
              ],
            ),
          ),
          // isDetail
          //     ? SizedBox(
          //         height: 20,
          //       )
          //     :
          if (!isDetail)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(),
              ),
            ),
        ],
      ),
    );
  }

  _onNextPage() {
    // AppNavigation.to(_context, PostDetailPage());
  }
}
