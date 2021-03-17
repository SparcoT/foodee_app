import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodee/src/base/constants.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/ui/pages/image-models.dart';
import 'package:foodee/src/ui/pages/near-by/near-by_model.dart';
import 'package:foodee/src/ui/pages/posts/post-detail_page.dart';
import 'package:foodee/src/ui/widgets/post_widget.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              imageContainerWidget(),
              followersWidget(),
              rowWidget(),
              richTextWidget(),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    iconWidget(
                        onTap: () {
                          print("Add Friend Button is Pressed!");
                        },
                        icon: Icons.person_add_outlined,
                        iconColors: Colors.white,
                        color: AppTheme.primaryColor),
                    iconWidget(
                        onTap: () {
                          print("Message Button is Pressed!");
                        },
                        icon: Icons.message_outlined),
                    iconWidget(
                        onTap: () {
                          print("Share Button is Pressed!");
                        },
                        icon: Icons.reply_outlined),
                    iconWidget(
                        onTap: () {
                          print("Mail Button is Pressed!");
                        },
                        icon: Icons.mail_outline_outlined),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            List.generate(
                imageModel.length,
                (i) => Hero(
                      tag: kPostTag,
                      child: PostWidget(
                        url: imageModel[i].url,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => PostDetailPage(
                                    url: imageModel[i].url,
                                  )));
                        },
                      ),
                    )).toList(),
          ),
        ),
      ],
    );
  }

  Widget imageContainerWidget() {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.none,
          constraints: BoxConstraints.expand(height: 230),
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://static.toiimg.com/photo/msid-71581763/71581763.jpg?259859',
              ),
            ),
          ),
          child: Align(
            alignment: Alignment(0, 1.8),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink[200], width: 2.5),
                shape: BoxShape.circle,
              ),
              // color: Colors.amber,
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image(
                  width: 80,
                  height: 80,
                  image: NetworkImage(
                    'https://i0.wp.com/www.newsgram.com/wp-content/uploads/2020/03/Katrina-Kaif.jpg',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // GestureDetector(child: Material(borderRadius: BorderRadius.circular(8),     elevation: 8,     child: Container(       decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.blue),child: Padding(padding: const EdgeInsets.all(3.0),child: Icon(Icons.edit,color: Colors.white,),),),),onTap: () {},),GestureDetector(child: CircleAvatar(child: Icon(Icons.edit),),   onTap: () {},),

              iconWidget(
                  onTap: () {
                    print("Edit Button is Pressed!");
                  },
                  icon: Icons.edit,
                  iconColors: Colors.white,
                  color: Colors.grey[300]),
              iconWidget(
                  onTap: () {
                    print("Setting Button is Pressed!");
                  },
                  icon: Icons.settings,
                  iconColors: Colors.white,
                  color: Colors.grey[300])
            ],
          ),
        )
      ],
    );
  }

  Widget followersWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          textContainer(text: "24.2k", textFollow: "Follower"),
          SizedBox(),
          textContainer(text: "100", textFollow: "Following"),
        ],
      ),
    );
  }

  Widget rowWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: textBold(text: 'Priscilla'),
          ),
          Container(
              height: 25,
              child: VerticalDivider(
                thickness: 2,
                color: Colors.grey,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: textBold(text: 'Design'),
          ),
        ],
      ),
    );
  }

  Widget richTextWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text:
                'I believe that to be distinctive,inspiring and \n innovative ',
            style: TextStyle(color: Colors.grey, fontSize: 13),
            children: <TextSpan>[
              TextSpan(text: '@Behance', style: TextStyle(color: Colors.blue))
            ]),
      ),
    );
  }

  Widget textBold({String text}) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget textContainer({String text, String textFollow}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            textFollow,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  Widget iconWidget(
      {Color iconColors, IconData icon, Color color, Function onTap}) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(50),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: color ?? Color(0xffededed),

          //onPressed: (){},
          child: Icon(
            icon,
            color: iconColors,
          ),
          //style: TextButton.styleFrom(
          //shape: CircleBorder()
        ),
      ),
    );
  }
}
