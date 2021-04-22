import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/app.dart';
import 'package:foodee/src/base/keys.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/services/lazy-task_service.dart';
import 'package:foodee/src/ui/modals/information_dialog.dart';
import 'package:foodee/src/ui/views/localized_view.dart';
import 'package:foodee/src/ui/widgets/text_field.dart';
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
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.primaryColor, AppTheme.primaryColor],
        ),
      ),
      child: LocalizedView(
        builder: (context, lang) {
          return Scaffold(
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
                    Text(
                      "Foodee",
                      style: GoogleFonts.pacifico(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfffcc522)),
                    ),
                    Text(
                      "let's choose your match",
                      style: TextStyle(
                        fontFamily: 'QuickSand',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    AppTextField(
                      key: Keys.signUpFirstName,
                      icon: UniconsLine.user,
                      placeholder: 'First Name',
                      keyboardType: TextInputType.name,
                      onSaved: (value) => firstName = value,
                      validator: Validators.required,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: AppTextField(
                        key: Keys.signUpLastName,
                        icon: UniconsLine.user,
                        placeholder: 'Last Name',
                        keyboardType: TextInputType.name,
                        onSaved: (value) => lastName = value,
                        validator: Validators.required,
                      ),
                    ),
                    AppTextField(
                      key: Keys.signUpUserName,
                      icon: UniconsLine.user,
                      placeholder: 'Username',
                      onSaved: (value) => userName = value,
                      validator: Validators.required,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: AppTextField(
                        key: Keys.signUpEmail,
                        icon: Icons.email_outlined,
                        placeholder: 'Email',
                        onSaved: (value) => email = value,
                        validator: Validators.requiredEmail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    AppTextField.password(
                      key: Keys.signUpPassword,
                      icon: UniconsLine.lock_alt,
                      placeholder: 'Password',
                      onSaved: (value) => password = value,
                      validator: Validators.required,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 40),
                      child: AppTextField.password(
                        key: Keys.signUpConfirmPassword,
                        icon: UniconsLine.lock_alt,
                        placeholder: 'Confirm Password',
                        onSaved: (value) => confirmPassword = value,
                        validator: Validators.required,
                      ),
                    ),
                    TextButton(
                      onPressed: _signUp,
                      child: Text(lang.signUpNow.toUpperCase()),
                      style: AppTheme.primaryButtonTheme,
                    ),
                    SizedBox(height: 20),
                    Text.rich(
                      TextSpan(
                        text: "Already have account?  ",
                        children: [
                          TextSpan(
                            text: lang.signIn,
                            style: TextStyle(fontWeight: FontWeight.w900),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context).pop(),
                          )
                        ],
                        style: GoogleFonts.quicksand(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _signUp() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      print('Sign In');
      if (password != confirmPassword) {
        scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('Password did not matched'),
          ),
        );
        return;
      }
      var hasError = false;
      final result = await LazyTaskService.execute<Response<User>>(
        context,
        () async {
          return await Openapi().getUsersApi().usersCreate(
                password: password,
                username: userName,
                firstName: firstName,
                lastName: lastName,
                email: email,
              );
        },
        throwError: true,
      ).catchError((e) {
        hasError = true;
        var errorMessage = 'No Internet Connection';
        if (e?.response?.data != null)
          errorMessage = e.response.data['message'];
        openInfoDialog(
          context: _context,
          title: 'Warning',
          content: errorMessage,
        );
      });
      if (result?.statusCode == 201) {
        print(result.data.email);
        scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('A verification link has been sent to your email'),
          ),
        );
        await Future.delayed(Duration(seconds: 4));
        Navigator.of(context).pop();
      } else {
        if (!hasError)
          scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text('A user already registered with this email'),
            ),
          );
      }
    } else
      setState(() => _autoValidateMode = AutovalidateMode.always);
  }
}
