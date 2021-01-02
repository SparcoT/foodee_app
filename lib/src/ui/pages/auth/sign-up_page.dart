import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/ui/views/localized_view.dart';
import 'package:foodee/src/ui/widgets/text_field.dart';
import 'package:foodee/src/utils/validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  var _username;
  var _email;
  var _password;
  final _key = GlobalKey<FormState>();
  var _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.primaryColor.shade400,
            AppTheme.primaryColor.shade900
          ],
        ),
      ),
      child: LocalizedView(
        builder: (context, lang) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _key,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(30, 60, 30, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  logo(imgPath: "assets/images/couple4.png"),
                  appTitle(),
                  description(),
                  Padding(
                    padding: const EdgeInsets.only( bottom:20),
                    child: AppTextField(
                      placeholder: 'Your Name',
                      icon: UniconsLine.user,
                      validator: Validators.required,
                      onSaved: (username) => _username = username,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( bottom:20),

                    child: AppTextField(
                      placeholder: 'Your Email',
                      icon: Icons.email_outlined,
                      onSaved: (email) => _email = email,
                      validator: Validators.requiredEmail,
                      keyboardType: TextInputType.emailAddress,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( bottom:20),
                    child: AppTextField.password(
                      placeholder: 'Enter Password',
                      icon: UniconsLine.lock_open_alt,
                      validator: Validators.requiredPassword,
                      onSaved: (password) => _password = password,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( bottom:40),
                    child: AppTextField.password(
                      icon: UniconsLine.lock_alt,
                      placeholder: 'Confirm Password',
                      onSaved: (value) => _password = value,
                      validator: Validators.requiredPassword,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( bottom:20),
                    child: TextButton(
                      onPressed: _signUp,

                      style: AppTheme.primaryButtonTheme,
                      // child: Text(lang.signUpNow.toUpperCase()),
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
          // extendBody: true,
          // bottomNavigationBar: Padding(
          //   padding: const EdgeInsets.only(bottom: 30),
          //   child: GestureDetector(
          //     onTap: () => AppNavigation.to(context, ForgotPasswordPage()),
          //     child: Text(
          //       lang.forgotPassword,
          //       textAlign: TextAlign.center,
          //       style: GoogleFonts.quicksand(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }

  _signUp() async {
    // if (_key.currentState.validate()) {
    //   var error;
    //   await performLazyTask(_context, () async {
    //     _key.currentState.save();
    //     User user =
    //         User(username: _username, password: _password, email: _email);
    //     await FoodeeService().createUser(user).catchError((e) {
    //       print(e);
    //       error = ServerError.withError(e);
    //     });
    //   });
    //   if (error != null) {
    //     errorChecks('Error', error.errorMessage);
    //   } else
    //     errorChecks(
    //         'Message', 'Verification email has been send successfully.');
    //   // AppNavigation.to(_context, FoodeeHomePage());

    }
  }

  errorChecks(String title, String message) {
    return showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text(
              'Error',
              textAlign: TextAlign.center,
              style: GoogleFonts.pacifico(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                  fontSize: 24
              ),
            ),
            content: Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(fontWeight: FontWeight.w500),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: StadiumBorder(), backgroundColor: Colors.brown),
                  child: Text(
                    'OK',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          );
        });
  }

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

