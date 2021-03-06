import 'package:flutter/material.dart';
import 'package:foodee/src/base/assets.dart';

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
