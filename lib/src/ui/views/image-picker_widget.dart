import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/ui/modals/confirmation_dialog.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final List<File> images;
  final Function(List<File>) onChanged;

  ImagePickerWidget({
    this.onChanged,
    this.images,
  }) : assert(onChanged != null);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  List<File> images;

  _modelSheet() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: AppTheme.secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Camera",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading:
                      Icon(CupertinoIcons.photo_camera, color: Colors.white),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(
                    "Gallery",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(CupertinoIcons.photo, color: Colors.white),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    images = widget.images ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: images.length + 1,
      itemBuilder: (ctx, index) {
        if (index != images.length)
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.file(
                images.elementAt(index),
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  color: AppTheme.secondaryColor,
                  icon: Icon(Icons.cancel),
                  onPressed: () async {
                    if (await openConfirmationDialog(
                        context: context,
                        title: 'Confirmation',
                        content: 'Do you really want to delete image?'))
                      setState(() => images.removeAt(index));

                    // setState(() {
                    //   imageFile.removeAt(i);
                    // }
                  },
                ),
              )
            ],
          );
        else
          return DottedBorder(
            color: Colors.black,
            dashPattern: [8, 4],
            strokeWidth: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _modelSheet,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppTheme.secondaryColor,
                        ),
                        width: 120,
                        height: 120,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.cloud_upload,
                            color: Colors.white,
                            size: 80,
                          ),
                        ),
                      ),
                    ),
                  ),SizedBox(height: 20,),
                  Text("Capture or add pick images from gallery",style: TextStyle(color: AppTheme.primaryColor),)
                ],
              ),
            ),
          );
        return Center(
          child: GestureDetector(
            onTap: _modelSheet,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppTheme.secondaryColor,
                ),
                width: 80,
                height: 80,
                child: Center(
                  child: Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _imgFromCamera() async {
    // ignore: invalid_use_of_visible_for_testing_member
    final pickedImage = await ImagePicker.platform
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedImage != null)
      setState(() {
        images.add(File(pickedImage.path));
        widget.onChanged(images);
      });
  }

  _imgFromGallery() async {
    final _result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    setState(() {
      images.addAll(_result.files.map((e) => File(e.path)));
      widget.onChanged(images);
    });
  }
}
