import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  List<File> imageFile = [];

  openGallery(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var galleryImage =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile.add(File(galleryImage.path));
    });
    Navigator.of(context).pop();
  }

  openCamera(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var cameraImage =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile.add(File(cameraImage.path));
    });
    Navigator.of(context).pop();
  }

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make a choice'),
            content: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () {
                    openGallery(context);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    openCamera(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  Widget _decideImageView() {
    if (imageFile.isEmpty) {
      return Text('');
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: imageFile.length,
        itemBuilder: (context, i) {
          return Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                imageFile[i],
                height: 300,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      imageFile.removeAt(i);
                    });
                  },
                ),
              ),
            )
          ]);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Create Post',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: null),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            width: 90,
            // ignore: deprecated_member_use
            child: RaisedButton(
                color: Colors.brown,
                splashColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.grey),
                ),
                child: Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {}),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              profileImageContainer(imgPath: 'assets/images/image.jpg'),
              postTitleContainer(title: 'Naseer Ahsan'),
            ],
          ),
          SizedBox(height: 10),
          textFieldContainer(hint: "What's on your mind"),
          Expanded(child: _decideImageView()),
          // ignore: deprecated_member_use
          RaisedButton(
              color: Colors.brown,
              splashColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.grey)),
              child: Text(
                'Select image',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                showChoiceDialog(context);
              }),
        ],
      ),
    );
  }

  Widget profileImageContainer({String imgPath}) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      // color: Colors.amber,
      height: 60,
      width: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image(
          width: 80,
          height: 80,
          image: AssetImage(imgPath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget textFieldContainer({String hint}) {
    return Container(
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget postTitleContainer({String title}) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   List<File> _images = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: CupertinoNavigationBar(
//         padding: EdgeInsetsDirectional.zero,
//         middle: Text(
//           'Create Post',
//           style: TextStyle(color: AppTheme.primaryColor),
//         ),
//         trailing: TextButton(
//           child: Icon(
//             CupertinoIcons.add,
//             size: 25,
//             color: AppTheme.primaryColor,
//           ),
//           style: TextButton.styleFrom(
//             padding: EdgeInsets.all(0),
//             shape: CircleBorder(),
//           ),
//           onPressed: () {},
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 maxLines: null,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: 'Type something here....',
//                 ),
//               ),
//               Wrap(
//                 children: [
//                   TaggedUser(name: 'Rashid'),
//                   TaggedUser(name: 'Arish'),
//                   TaggedUser(name: 'Asad'),
//                   TaggedUser(name: 'Usama'),
//                   TaggedUser(name: 'Zain'),
//                   TaggedUser(name: 'Nabeel'),
//                   TaggedUser(name: 'Haroon'),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 15.0),
//                 child: SizedBox(
//                   height: 300,
//                   child: ImagePickerWidget(
//                     images: _images,
//                     onChanged: (value) => _images = value,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class TaggedUser extends StatelessWidget {
//   final String name;
//
//   TaggedUser({this.name});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(2.0),
//       padding: EdgeInsets.fromLTRB(10, 3, 7, 3),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25.0),
//         color: AppTheme.secondaryColor,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             name,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 12.0,
//             ),
//           ),
//           SizedBox(width: 7),
//           Icon(
//             CupertinoIcons.clear,
//             size: 10,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
}
