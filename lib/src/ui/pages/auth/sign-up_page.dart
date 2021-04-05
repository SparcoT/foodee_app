import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/ui/views/localized_view.dart';
import 'package:foodee/src/ui/widgets/text_field.dart';
import 'package:foodee/src/utils/lazy_task.dart';
import 'package:foodee/src/utils/validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openapi/openapi.dart';
import 'package:unicons/unicons.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _key = GlobalKey<FormState>();
  String userName, firstName, lastName, email, password, confirmPassword;
  var _autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.primaryColor, AppTheme.primaryColor],
        ),
      ),
      child: LocalizedView(
        builder: (context, lang) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            autovalidateMode: _autoValidateMode,
            key: _key,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(30, 60, 30, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // logo(imgPath: "assets/images/couple4.png"),
                  appTitle(),
                  description(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AppTextField(
                      key: UniqueKey(),
                      placeholder: 'First Name',
                      icon: UniconsLine.user,
                      validator: Validators.required,
                      onSaved: (firstname) => firstName = firstname,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AppTextField(
                      key: UniqueKey(),
                      placeholder: 'Last Name',
                      icon: UniconsLine.user,
                      validator: Validators.required,
                      onSaved: (lastname) => lastName = lastname,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AppTextField(
                      key: UniqueKey(),
                      placeholder: 'Username',
                      icon: UniconsLine.user,
                      validator: Validators.required,
                      onSaved: (username) => userName = username,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AppTextField(
                      key: UniqueKey(),
                      placeholder: 'Your Email',
                      icon: Icons.email_outlined,
                      onSaved: (value) => email = value,
                      validator: Validators.requiredEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AppTextField.password(
                      key: UniqueKey(),
                      placeholder: 'Enter Password',
                      icon: UniconsLine.lock_open_alt,
                      validator: Validators.requiredPassword,
                      onSaved: (password) => this.password = password,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: AppTextField.password(
                      key: UniqueKey(),
                      icon: UniconsLine.lock_alt,
                      placeholder: 'Confirm Password',
                      onSaved: (value) => confirmPassword = value,
                      validator: Validators.requiredPassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextButton(
                      onPressed: _signUp,
                      style: AppTheme.primaryButtonTheme,
                      child: Text(lang.signUpNow.toUpperCase()),
                    ),
                  ),
                  Text.rich(TextSpan(
                    text: "Already have account?  ",
                    children: [
                      TextSpan(
                        // text: lang.signIn,
                        style: TextStyle(fontWeight: FontWeight.w900),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Tapped');
                          },
                      )
                    ],
                    style: GoogleFonts.quicksand(color: Colors.white),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _signUp() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      final result = await performLazyTask(context, () async {
        // User signUpUser = User((signUp) {
        //   signUp
        //     ..firstName = firstName
        //     ..lastName = lastName
        //     ..username = userName
        //     ..password = password
        //     ..email = email;
        // });
        return await Openapi().getUsersApi().usersCreate(
              password: password,
              username: userName,
              firstName: firstName,
              lastName: lastName,
              email: email,
            );
      });
      print(result.statusMessage);
      if (result.statusCode == 201) {
        print(result.data.email);
      }
    } else
      setState(() => _autoValidateMode = AutovalidateMode.always);
  }

  // errorChecks(String title, String message) {
  //   return showDialog(
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //           title: Text(
  //             'Error',
  //             textAlign: TextAlign.center,
  //             style: GoogleFonts.pacifico(
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.brown,
  //                 fontSize: 24),
  //           ),
  //           content: Text(
  //             message,
  //             textAlign: TextAlign.center,
  //             style: GoogleFonts.quicksand(fontWeight: FontWeight.w500),
  //           ),
  //           actions: <Widget>[
  //             Padding(
  //               padding: const EdgeInsets.only(right: 5),
  //               child: TextButton(
  //                 style: TextButton.styleFrom(
  //                     shape: StadiumBorder(), backgroundColor: Colors.brown),
  //                 child: Text(
  //                   'OK',
  //                   textAlign: TextAlign.center,
  //                   style: GoogleFonts.quicksand(
  //                       color: Colors.white, fontWeight: FontWeight.bold),
  //                 ),
  //                 onPressed: () async {
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //       context: _context);
  // }

  Widget description() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        "let's choose your match",
        style: TextStyle(fontFamily: "QuickSand", fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget appTitle() {
    return Text(
      "Foodee",
      style: GoogleFonts.pacifico(
          fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xfffcc522)),
    );
  }

  Widget logo({String imgPath}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Image.asset("$imgPath"),
            width: 180,
            height: 180,
          ),
        ),
      ),
    );
  }
}
