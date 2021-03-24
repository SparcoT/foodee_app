import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/ui/pages/auth/changePassword.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isCheck = false;
  bool isCheck1 = false;
  bool isCheck2 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SwitchListTile  (title: Text("Notifications on"), value: isSwitched, activeColor: AppTheme.primaryColor, onChanged: (val) {setState(() {isSwitched = val;});}),
          CheckboxListTile(title: Text("Push Notifications"), activeColor: AppTheme.primaryColor, value: isCheck, onChanged: (newCheck) {setState(() {isCheck = newCheck;});}),
          SwitchListTile  (title: Text("Notifications on"), value: isSwitched1, activeColor: AppTheme.primaryColor, onChanged: (val) {setState(() {isSwitched1 = val;});}),
          CheckboxListTile(title: Text("Push Notifications"), activeColor: AppTheme.primaryColor, value: isCheck1, onChanged: (newCheck) {setState(() {isCheck1 = newCheck;});}),
          SwitchListTile  (title: Text("Notifications on"), value: isSwitched2, activeColor: AppTheme.primaryColor, onChanged: (val) {setState(() {isSwitched2 = val;});}),
          CheckboxListTile(title: Text("Push Notifications"), activeColor: AppTheme.primaryColor, value: isCheck2, onChanged: (newCheck) {setState(() {isCheck2 = newCheck;});}),
          ListTile        (title: Text("Change Password"), trailing: Icon(Icons.arrow_forward_ios),onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePassword()));},),
          ListTile        (title: Text("Logout"), trailing: Icon(Icons.logout),onTap: () {Navigator.of(context).popUntil((route) => false);},)
        ],
      ),
    );
  }
}
