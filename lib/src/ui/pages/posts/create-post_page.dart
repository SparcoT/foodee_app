import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/assets.dart';
import 'package:foodee/src/base/nav.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/data/data.dart';
import 'package:built_collection/built_collection.dart';
import 'package:foodee/src/services/lazy-task_service.dart';
import 'package:foodee/src/ui/modals/confirmation_dialog.dart';
import 'package:foodee/src/ui/modals/information_dialog.dart';
import 'package:foodee/src/ui/pages/posts/tags_page.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openapi/openapi.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _textController = TextEditingController();
  List<User> _selectedUsers = [];

  // List<File> images;

  Widget head() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: AppTheme.primaryColor,
          backgroundImage: AppData().getImage().isEmpty
              ? AssetImage(AppAssets.user)
              : NetworkImage(AppData().getImage()),
        ),
        postTitleContainer(
          title: AppData().getName(),
        ),
      ],
    );
  }

  Widget postTitleContainer({String title}) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
          children: [
            if (_selectedUsers.isNotEmpty) ...[
              TextSpan(
                text: ' is with',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              ..._selectedUsers
                  .map<TextSpan>(
                    (e) => TextSpan(
                      text:
                          ' ${e.firstName}${e != _selectedUsers.last ? ',' : ''}',
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  )
                  .toList(),
            ]
          ],
        ),
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
        // padding: EdgeInsetsDirectional.zero,
        middle: ShaderText(
          shaderText: "Create Post",
        ),
        trailing: GestureDetector(
          child: Text('Post'),
          onTap: _addPost,
        ),
      ),
      body: Padding(
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
            if (_images.isEmpty) ...[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(CupertinoIcons.photo),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                    ),
                    Text(
                      'No Images Selected',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: _images.length,
                  itemBuilder: (context, i) => GestureDetector(
                    onLongPress: () async {
                      if (await openConfirmationDialog(
                        context: context,
                        content: 'Are you sure you want to delete',
                        title: 'Delete Image',
                      )) {
                        _images.removeAt(i);
                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 300,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: FileImage(
                            _images[i],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
      bottomSheet: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 5),
            ),
          ],
        ),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: bottomNavButton(
                CupertinoIcons.photo_camera,
                'Camera',
                _imgFromCamera,
                Colors.blue,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: bottomNavButton(
                CupertinoIcons.photo,
                'Gallery',
                _imgFromGallery,
                Colors.pink,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: bottomNavButton(
                CupertinoIcons.tag,
                'Tags',
                () {
                  AppNavigation.to(
                    context,
                    TagsPage(
                      selectedUsers: _selectedUsers,
                      onChanged: (users) {
                        _selectedUsers = users;
                        setState(() {});
                      },
                    ),
                  );
                },
                Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavButton(
      IconData icon, String text, Function onPressed, Color color) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
        size: 17,
      ),
      label: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(17, 17),
      ),
    );
  }

  _imgFromCamera() async {
    final pickedImage = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedImage != null)
      setState(() {
        _images.add(File(pickedImage.path));
      });
  }

  _imgFromGallery() async {
    final _result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    setState(() {
      _images.addAll(_result.files.map((e) => File(e.path)));
    });
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
        final createPost = FeedWrite(
          (feed) {
            feed
              ..user = AppData().getUserId()
              ..description = _textController.text
              ..commentsCount = 0
              ..tags = SetBuilder(_selectedUsers.isEmpty
                  ? []
                  : _selectedUsers.map((e) => e.id).toList())
              ..likesCount = 0;
          },
        );
        return Openapi().getFeedsApi().feedsCreate(data: createPost);
      },
      throwError: true,
    ).catchError((e) {
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
          if (imageRes == 'Success') _pop();
        } else
          _pop();
      }
    }
  }

  _pop() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Post Created!'),
      ),
    );
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pop();
  }
}
