// import 'package:foodee/src/app.dart';
// import 'package:unicons/unicons.dart';
// import 'package:flutter/material.dart';
// import 'package:foodee/src/base/keys.dart';
// import 'package:foodee/src/base/theme.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:foodee/src/ui/widgets/text_field.dart';
// import 'package:foodee/src/ui/views/localized_view.dart';
//
// class ChangePassword extends StatefulWidget {
//   @override
//   _ChangePasswordState createState() => _ChangePasswordState();
// }
//
// class _ChangePasswordState extends State<ChangePassword> {
// //  final _data = AuthRequest();
//   final _key = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [AppTheme.primaryColor, AppTheme.primaryColor],
//         ),
//       ),
//       child: LocalizedView(
//         builder: (context, lang) => Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Center(
//             child: Form(
//               key: _key,
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.fromLTRB(30, 60, 30, 30),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // logo(imgPath: "assets/images/couple4.png"),
//                     Text(
//                       App.name,
//                       style: GoogleFonts.pacifico(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xfffcc522),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 15),
//                       child: Text(
//                         "let's choose your match",
//                         style: TextStyle(
//                           fontFamily: 'QuickSand',
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20),
//                       child: AppTextField.password(
//                                 key:UniqueKey(),
//                         placeholder: "Current Password",
//                         icon: UniconsLine.lock_open_alt,
//                         validator: (val) {
//                           return val.isEmpty ? "Required" : null;
//                         },
//                         //    validator: Validators.requiredPassword,//
//                         onSaved: (password) => _data.password = password,
//                         autoValidateMode: AutovalidateMode.onUserInteraction,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20),
//                       child: AppTextField.password(
//                         //        key: Keys.signInPassword,
//                         key:UniqueKey(),
//                         placeholder: "News Password",
//                         icon: UniconsLine.lock_open_alt,
//                         validator: (val) {
//                           return val.isEmpty ? "Required" : null;
//                         },
//                         //    validator: Validators.requiredPassword,//
//                         onSaved: (password) => _data.password = password,
//                         autoValidateMode: AutovalidateMode.onUserInteraction,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20),
//                       child: AppTextField.password(
//                         //        key: Keys.signInPassword,
//                         key:UniqueKey(),
//                         placeholder: "ReType New Password",
//                         icon: UniconsLine.lock_open_alt,
//                         validator: (val) {
//                           return val.isEmpty ? "Required" : null;
//                         },
//                         //    validator: Validators.requiredPassword,//
//                         onSaved: (password) => _data.password = password,
//                         autoValidateMode: AutovalidateMode.onUserInteraction,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10, bottom: 15),
//                       child: TextButton(
//                         key: Keys.signInButton,
//
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         // onPressed: () => AppNavigation.to(context, HomePage()),
//                         style: AppTheme.primaryButtonTheme,
//                         child: Text("Confirm"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           extendBody: true,
//         ),
//       ),
//     );
//   }
//
//   // _signIn() async {
//   //   if (_key.currentState.validate()) {
//   //     _key.currentState.save();
//   //     AppNavigation.to(context, HomePage());      // AppServices().signIn(_data);
//   //   }
//   // }
//
//   invalidUser(String message, bool isEmail) {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//           title: Text(
//             'Error',
//             textAlign: TextAlign.center,
//             style: GoogleFonts.pacifico(
//               fontWeight: FontWeight.bold,
//               color: Colors.brown,
//               fontSize: 24,
//             ),
//           ),
//           content: Text(
//             message,
//             textAlign: TextAlign.center,
//             style: GoogleFonts.quicksand(fontWeight: FontWeight.w500),
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.only(right: 5),
//               child: TextButton(
//                 style: TextButton.styleFrom(
//                   shape: StadiumBorder(),
//                   backgroundColor: Colors.brown,
//                 ),
//                 child: Text(
//                   'OK',
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.quicksand(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onPressed: Navigator.of(context).pop,
//               ),
//             ),
//             if (isEmail) TextButton(child: Text('Resend'), onPressed: _resend),
//           ],
//         );
//       },
//     );
//   }
//
//   _resend() async {
//     // Navigator.of(context).pop();
//     // await performLazyTask(context, () async {
//     //   await FoodeeService().resendEmail(email: _email).catchError((e) {
//     //     print(e);
//     //   });
//     // });
//   }
//
//   Widget logo({String imgPath}) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 20),
//         child: Material(
//           elevation: 8,
//           borderRadius: BorderRadius.circular(50),
//           child: Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: Image.asset("$imgPath"),
//             width: 180,
//             height: 180,
//           ),
//         ),
//       ),
//     );
//   }
// }
