import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/assets.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/data/data.dart';
import 'package:built_collection/built_collection.dart';
import 'package:foodee/src/services/lazy-task_service.dart';
import 'package:foodee/src/ui/modals/information_dialog.dart';
import 'package:foodee/src/ui/views/image-picker_widget.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openapi/openapi.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _textController = TextEditingController();

  Widget head() {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(left: 0),
      leading: CircleAvatar(
        backgroundColor: AppTheme.primaryColor,
        backgroundImage: AppData().getImage().isEmpty
            ? AssetImage(AppAssets.user)
            : NetworkImage(AppData().getImage()),
      ),
      title: postTitleContainer(title: "Osama Sandhu"
          //  AppData().getName()
          ),
    );
    Row(
      children: <Widget>[],
    );
  }

  Widget postTitleContainer({String title}) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: ShaderText(
        shaderText: title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<File> _images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.zero,
        middle: ShaderText(
          shaderText: "Create Post",
        ),
        trailing: Padding(
          padding: EdgeInsets.only(right: 8),
          child: TextButton(
              child: Text(
                "Post",
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                //a_addPost,
              }),
        ),
      ),
      body: SingleChildScrollView(
   physics: BouncingScrollPhysics(),     child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              head(),
              TextFormField(
                controller: _textController,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something here....',
                ),
              ),
              Wrap(
                spacing: 3,
                runSpacing: 3,
                children: [
                  TaggedUser(name: 'Arish'),
                  TaggedUser(name: 'Nabeel'),
                  TaggedUser(name: 'Rashid'),
                  TaggedUser(name: 'Usman'),
                  TaggedUser(name: 'Zain'),
                  TaggedUser(name: 'Osama'),
                  TaggedUser(name: 'Haroon'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: ImagePickerWidget(
                    images: _images,
                    onChanged: (value) => _images = value,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _addPost() async {
    if (_textController.text?.isEmpty ?? true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter description'),
        ),
      );
      return;
    }
    final _result = await LazyTaskService.execute<Response<FeedWrite>>(
      context,
      () async {
        print(AppData().getUserId());
//        var imagesUrl = [];
        final createPost = FeedWrite(
          (feed) {
            feed
              ..user = AppData().getUserId()
              ..description = _textController.text
              ..commentsCount = 0
              ..tags = SetBuilder([])
              ..likesCount = 0;
          },
        );
        print(createPost.description);
        final result =
            await Openapi().getFeedsApi().feedsCreate(data: createPost);
        // if (result.statusCode == 201) {}
        return result;
      },
      throwError: true,
    ).catchError((e) {
      print('eeeeeeeeeeeeeeeee');
      print(e);
      var errorMessage = 'No Internet Connection';
      if (e?.response?.data != null) errorMessage = e.response.data['message'];
      openInfoDialog(
        context: context,
        title: 'Warning',
        content: errorMessage ?? 'error',
      );
    });
    if (_result != null) {
      print('===Message===');
      print(_result);
      print(_result.statusCode);
      if (_result.statusCode == 201) {
        if (_images.isNotEmpty) {
          final imageRes = await LazyTaskService.execute<String>(
            context,
            () async {
              _images.forEach((image) async {
                print(_result.data.id);
                final response = await Dio().post(
                  '${Openapi.basePath}/feeds/images',
                  data: FormData.fromMap(
                    {
                      'path': await MultipartFile.fromFile(image.path),
                      'post': _result.data.id,
                    },
                  ),
                  options: Options(
                    headers: {'content-type': 'multipart/form-data'},
                  ),
                );
                print(response.data);
              });
              return 'Success';
            },
            throwError: true,
          ).catchError((e) {
            print(e);
          });
          print(imageRes);
        }
      }
    }
  }

// Future<Uint8List> _readFileByte(File file) async {
//   Uint8List bytes;
//   await file.readAsBytes().then((value) {
//     bytes = Uint8List.fromList(value);
//     print('reading of bytes is completed');
//   }).catchError((onError) {
//     print('Exception Error while reading audio from path:' +
//         onError.toString());
//   });
//   return bytes;
// }

}

class TaggedUser extends StatelessWidget {
  final String name;

  TaggedUser({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 3, 7, 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppTheme.secondaryColor.withOpacity(0.8),
        //      color: AppTheme.primaryColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
          SizedBox(width: 7),
          Icon(
            CupertinoIcons.clear,
            size: 10,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
