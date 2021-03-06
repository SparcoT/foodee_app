import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/assets.dart';

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PostWidget(),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class PostWidget extends StatelessWidget {
  var _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    final url = 'https://images.unsplash.com/photo-1547721064-da6cfb341d50';
    return Column(
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
                child: Icon(
                  CupertinoIcons.chat_bubble,
                  size: 25,
                ),
              ),
              Text('1k'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(),
        ),
        // Container(
        //   height: 30,
        //   margin: EdgeInsets.all(15.0),
        //   decoration: BoxDecoration(
        //     border: Border(
        //       top: BorderSide(color: Colors.black),
        //       bottom: BorderSide(color: Colors.black)
        //     )
        //   ),
        //   child: Stack(
        //     children: [
        //       Image.asset(
        //         AppAssets.searchDark,
        //         width: 2,
        //       ),
        //       Image.asset(
        //         AppAssets.homeLight,
        //         width: 34,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class LikeButtonWidget extends StatefulWidget {
  final bool isFavourite;
  final Function(bool) onChanged;

  LikeButtonWidget({
    this.onChanged,
    this.isFavourite,
  }) : assert(onChanged != null);

  @override
  _LikeButtonWidgetState createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _sizeController;
  var _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavourite ?? false;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    _sizeController = Tween<double>(
      end: 1.3,
      begin: 1,
    ).animate(
      CurvedAnimation(curve: Curves.easeIn, parent: _animationController),
    );
    return AnimatedBuilder(
      animation: _animationController,
      builder: (ctx, _) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: GestureDetector(
            child: Transform.scale(
              scale: _sizeController.value,
              child: _isFavorite
                  ? ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: [
                            Colors.red,
                            Colors.red.shade200,
                          ],
                          tileMode: TileMode.mirror,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      child: Image.asset(
                        AppAssets.favoriteRed,
                        width: 30,
                      ),
                    )
                  : Image.asset(
                      AppAssets.favoriteEmpty,
                      // color: Colors.red,
                      width: 30,
                    ),
            ),
            onTap: () async {
              _isFavorite = !_isFavorite;
              try {
                await _animationController.forward().orCancel;
              } catch (_) {} finally {
                _animationController.reset();
              }
            },
          ),
        );
      },
    );
  }
}
