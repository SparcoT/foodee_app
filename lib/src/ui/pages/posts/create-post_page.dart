import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/data/data.dart';
import 'package:built_collection/built_collection.dart';
import 'package:foodee/src/services/lazy-task_service.dart';
import 'package:foodee/src/ui/modals/information_dialog.dart';
import 'package:foodee/src/ui/views/image-picker_widget.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';
import 'package:openapi/openapi.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _textController = TextEditingController();

  Widget head() {
    return Row(
      children: <Widget>[
        CircleAvatar(
            backgroundColor: AppTheme.primaryColor,
            backgroundImage: NetworkImage(
                "https://scontent.fmux2-1.fna.fbcdn.net/v/t31.0-8/20369872_845956172224685_1100074056007641237_o.jpg?_nc_cat=105&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=SRnYtPW-3fwAX8-Zhx7&_nc_ht=scontent.fmux2-1.fna&oh=3016c3eb46786a39855a44468e26a1cc&oe=60816634")),
        postTitleContainer(title: "Osama"),
      ],
    );
  }

  Widget textFieldContainer({String hint}) {
    return Container(
      child: TextField(
        controller: _textController,
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(fontSize: 20),
        ),
      ),
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
            onPressed: _addPost,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              head(),
              TextFormField(
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
    final _result = await LazyTaskService.execute<Response<FeedWrite>>(
      context,
      () async {
        print('RRRRRRRRRRRRRRRRR User Id RRRRRRRRRRRRRRRR');
        print(AppData().getUserId());
        final createPost = FeedWrite(
          (feed) {
            feed
              ..user = AppData().getUserId()
              ..description = 'Zain testing'
              ..commentsCount = 0
              ..tags = SetBuilder([])
              ..likesCount = 0;
          },
        );
        print(createPost.description);
        final result =
            await Openapi().getFeedsApi().feedsCreate(data: createPost);
        if (result.statusCode == 201) {
          _images.forEach((image) async {
            final uIntBytes = await image.readAsBytes();
            print(uIntBytes.length);
            await Dio().post(
              '${Openapi.basePath}/feeds/images',
              data: FormData.fromMap(
                {
                  'path': await MultipartFile.fromFile(image.path),
                  'post': result.data.id,
                },
              ),
              options: Options(
                headers: {'content-type': 'multipart/form-data'},
              ),
            );
          });
        }
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
          await LazyTaskService.execute(
            context,
            () async {},
            throwError: true,
          ).catchError((e) {
            print(e);
          });
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
