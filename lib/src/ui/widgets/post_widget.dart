import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/assets.dart';
import 'package:foodee/src/ui/pages/posts/post-detail_page.dart';
import 'package:foodee/src/ui/widgets/like-button_widget.dart';

// ignore: must_be_immutable
class PostWidget extends StatelessWidget {
  final bool isDetail;

  PostWidget({this.isDetail = false});

  var _isFavourite = false;
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    final url =
        'https://images.pexels.com/photos/3236736/pexels-photo-3236736.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260';
    return SizedBox(
      height: 319,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: isDetail ? null : _onNextPage,
            child: Material(
              child: ListTile(
                tileColor: Colors.white,
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
                    'Nguyen Shane',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'MazzardHBold',
                    ),
                  ),
                ),
                subtitle: Row(
                  children: [
                    // Icon(
                    //   CupertinoIcons.tag,
                    //   size: 19,
                    // ),
                    Text(
                      'Poland',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'MazzardHExtraLight',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                trailing: GestureDetector(
                  child: Image.asset(
                    AppAssets.more,
                    width: 22,
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(25.0, 0, 10.0, 25.0),
          //   child: ExpandableText(
          //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nulla et nibh convallis semper. Aenean eu vulputate dolor. Nullam non tristique arcu. Morbi sit amet pretium ipsum. Fusce non ex dignissim, porta lectus non, eleifend quam. In mollis tempor mauris, a sagittis leo porttitor id. Suspendisse tempus ex velit, id placerat massa volutpat et. Duis massa lectus, sagittis id nulla non, convallis maximus libero. Mauris at lorem libero. Phasellus magna neque, sodales id justo eu, consequat viverra turpis.',
          //   ),
          // ),
          Container(
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(
                  url,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // CarouselSlider.builder(
          //   itemCount: 1,
          //   itemBuilder: (ctx, index, _) {
          //     return Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(15.0),
          //         image: DecorationImage(
          //           image: NetworkImage(
          //             url,
          //           ),
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     );
          //   },
          //   options: CarouselOptions(
          //     enlargeCenterPage: true,
          //     reverse: false,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 5, 5),
            child: Row(
              children: [
                LikeButtonWidget(
                  onChanged: (value) => _isFavourite = value,
                  isFavourite: _isFavourite,
                ),
                Text('16k'),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5),
                  child: GestureDetector(
                    onTap: isDetail ? null : _onNextPage,
                    child: Icon(
                      CupertinoIcons.chat_bubble,
                      size: 25,
                    ),
                  ),
                ),
                Text('1k'),
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
    Navigator.of(_context)
        .push(MaterialPageRoute(builder: (builder) => PostDetailPage()));
    // AppNavigation.to(_context, PostDetailPage());
  }
}
