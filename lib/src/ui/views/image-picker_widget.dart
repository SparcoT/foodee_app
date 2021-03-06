import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          return InkWell(
            onLongPress: () async {
              if (await openConfirmationDialog(
                  context: context,
                  title: 'Confirmation',
                  content: 'Do you really want to delete image?'))
                setState(() => images.removeAt(index));
            },
            child: Image.file(images.elementAt(index)),
          );
        else
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Icon(
                  CupertinoIcons.photo_camera,
                  color: Colors.white,
                ),
                onPressed: _imgFromCamera,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: CircleBorder(),
                ),
              ),
              TextButton(
                child: Icon(
                  CupertinoIcons.photo,
                  color: Colors.white,
                ),
                onPressed: _imgFromGallery,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: CircleBorder(),
                ),
              ),
            ],
          );
      },
    );
  }

  _imgFromCamera() async {
    final pickedImage = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
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
