import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/ui/widgets/text_field.dart';
import 'package:foodee/src/utils/validators.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String image = "";

  openGallery(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var picture =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    this.setState(() {
      image = picture.path;
    });
    Navigator.of(context).pop();
  }

  openCamera(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var picture =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    this.setState(() {
      image = picture.path;
    });
    Navigator.of(context).pop();
  }

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Make a choice'),
          content: SingleChildScrollView(
            child: ListBody(
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
          ),
        );
      },
    );
  }

  int twoGroupValue = 0;
  final Map<int, Widget> segmentWidget = const <int, Widget>{
    0: Text('50%'),
    1: Text('Treat Me'),
  };

  var formKey  = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
   bool showAge = false;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.primaryColor, AppTheme.primaryColor],
        ),
      ), child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Stack(
                    fit: StackFit.loose,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                             border: Border.all(
                                color: Theme.of(context).primaryColor, width: 3),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 60,
                            backgroundImage: (image.isNotEmpty)
                                ? FileImage(File(image))
                                : AssetImage("assets/images/appLogo.png")),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 0,
                        child: MaterialButton(
                            minWidth: 30,

                            shape: CircleBorder(),
                            color: Colors.white,
                            padding: EdgeInsets.all(0),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            child: Icon(
                              Icons.camera_alt,
                              color: Theme.of(context).primaryColor,
                              size: 16,
                            ),
                            onPressed: () {
                              showChoiceDialog(context);
                            }
                            //       () async {
                            //   PickedFile tempImage = await ImagePicker.platform.pickImage(source: ImageSource.gallery,maxHeight: 1000,maxWidth: 1000,imageQuality: 50);
                            //   if (mounted && tempImage!=null)
                            //     setState(() {
                            //    image ='';
                            //    //image.clear();
                            //      // image.add({'${tempImage.path.split('/')[0]}' : tempImage.path});
                            //     });
                            // },
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextField(
                  key: UniqueKey(),
                  icon: Icons.person,
                  keyboardType: TextInputType.name,
                  placeholder: "UserName",
                  //onSaved: (name) => username = name,
                  validator: Validators.required,
                  //autoValidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextField(
                  key: UniqueKey(),
                  icon: Icons.phone,
                  placeholder: 'Phone',
                  keyboardType: TextInputType.phone,
                 // onSaved: (phone) => user.phone = phone,
                  validator: Validators.required,
 //                 autoValidateMode: AutovalidateMode.onUserInteraction,

                  //  controller: lastNameController,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextField(
                  key: UniqueKey(),
                  icon: Icons.date_range_outlined,

                  placeholder: 'Age',
                //  onSaved: (age) => user.age = int.parse(age),
                  validator: Validators.required,
                  //autoValidateMode: AutovalidateMode.onUserInteraction,

                  //  controller: lastNameController,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextField(
                  key: UniqueKey(),
                  icon: Icons.person_outline,
                  placeholder: 'Gender',
                 // onSaved: (gender) => user.gender = gender,
                  validator: Validators.required,
                  //autoValidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextField(
                  key: UniqueKey(),
                  icon: Icons.home_outlined,
                  placeholder: 'Address',
                 // onSaved: (address) => user.address = address,
                  validator: Validators.required,
                  //autoValidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(
                  height: 10,
                ),
                CheckboxListTile(
                    title: Text(
                      'Show age on your profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: showAge,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool value) {
                      setState(() {
                        showAge = value;
                      });
                    }),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoSegmentedControl(
                    groupValue: twoGroupValue,
                    onValueChanged: (changeFromGroupValue) {
                      setState(() {
                        twoGroupValue = changeFromGroupValue;
                      });
                    },
                    children: segmentWidget,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: TextButton(
                    //  key: Keys.signInButton,
                    onPressed: () {
//print(user);
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                     //   print(user);
                      }
                      //AppNavigation.to(context, HomePage());
                    },
                    style: AppTheme.primaryButtonTheme,
                    child: Text("Update"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
