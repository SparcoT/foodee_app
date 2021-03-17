import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodee/src/base/assets.dart';
import 'package:foodee/src/base/constants.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/ui/widgets/post_widget.dart';

class PostDetailPage extends StatefulWidget {
  String url;
  PostDetailPage({this.url});
  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CupertinoNavigationBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Hero(
              tag: kPostTag,
              child: PostWidget(isDetail: true,url:widget.url ,),
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
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                  2,
                  (index) => CommentRow(
                        index: index,
                      )).toList(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 80,
              color: Color(0xfff6f6f6),
            ),
          ),
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: 2,
          //   itemBuilder: (ctx, index) {
          //     return CommentRow();
          //   },
          // ),
        ],
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: Column(
      //         children: [
      //           CommentRow(),
      //           CommentRow(),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextFormField(
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
                onPressed: () {},
                child: SvgPicture.asset(
                  AppAssets.send,
                  color: Colors.white,
                  width: 23,
                ),
                // child: Icon(
                //   CupertinoIcons.search,
                //   color: Colors.white,
                // ),
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
}

class CommentRow extends StatefulWidget {
  final int index;

  CommentRow({this.index});

  @override
  _CommentRowState createState() => _CommentRowState();
}

class _CommentRowState extends State<CommentRow> {
  @override
  Widget build(BuildContext context) {
    final url =
        "https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI";
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff6f6f6),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(left: 20.0, right: 30),
            leading: Container(
              width: 47,
              height: 47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                image: DecorationImage(
                  image: NetworkImage(
                    url,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                'Miles Esther',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'MazzardHBold',
                ),
              ),
            ),
            subtitle: Text(
              '${widget.index.toString()} Hours',
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
              'Texture, Lightening, filters colors choices event the black&white scenes they are all perfect',
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
