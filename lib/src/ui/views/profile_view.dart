import 'package:flutter/material.dart';
import 'package:foodee/src/base/constants.dart';
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
              SizedBox(
                height: 15,
              ),
              rowWidget(),
              SizedBox(
                height: 15,
              ),
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
                        icon: Icons.person_add_outlined,
                        iconColors: Colors.white,
                        color: Colors.blue),
                    iconWidget(icon: Icons.message_outlined),
                    iconWidget(icon: Icons.reply_outlined),
                    iconWidget(icon: Icons.mail_outline_outlined),
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
                4,
                (index) => Hero(
                      tag: kPostTag,
                      child: PostWidget(),
                    )
            ).
            toList(),
          ),
        ),
      ],
    );
    // return Column(
    //   children: <Widget>[
    //     Expanded(
    //       child: ListView.builder(
    //         itemBuilder: (context, i) {
    //           return ListTile(
    //             title: Text("Name $i"),
    //             leading: CircleAvatar(
    //               backgroundColor: i % 2 == 0 ? Colors.red : Colors.yellow,
    //               child: Text("$i"),
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget imageContainerWidget() {
    return Container(
      clipBehavior: Clip.none,
      constraints: BoxConstraints.expand(height: 200),
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://images.pexels.com/photos/3236736/pexels-photo-3236736.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
          ),
        ),
      ),
      child: Align(
        alignment: Alignment(0, 2),
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
                'https://images.pexels.com/photos/2576787/pexels-photo-2576787.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget followersWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        textContainer(text: "24.2k", textFollow: "Follower"),
        SizedBox(),
        textContainer(text: "100", textFollow: "Following"),
      ],
    );
  }

  Widget rowWidget() {
    return Row(
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
    );
  }

  Widget richTextWidget() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'I believe that to be distinctive,inspiring and \n innovatine ',
          style: TextStyle(color: Colors.grey, fontSize: 13),
          children: <TextSpan>[
            TextSpan(text: '@Behance', style: TextStyle(color: Colors.blue))
          ]),
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

  Widget iconWidget({Color iconColors, IconData icon, Color color}) {
    return GestureDetector(
      onTap: () {
        print("Hello");
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color ?? Colors.grey[400],
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColors ?? Colors.black,
            size: 20,
          ),
        ),
      ),
    );
  }
}
