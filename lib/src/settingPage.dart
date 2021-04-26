import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/theme.dart';

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
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.secondaryColor,
        title: Text("Setting"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ListTile(
              title: Text("About Us"),
            ),
            ListTile(
              title: Text("Contact Us"),
            ),
            ListTile(
              title: Text("Help"),
            ),
            CheckboxListTile(
                title: Text("Push Notifications"),
                activeColor: AppTheme.primaryColor,
                value: isCheck,
                onChanged: (newCheck) {
                  setState(() {
                    isCheck = newCheck;
                  });
                }),

            SwitchListTile(
                title: Text("Notifications on"),
                value: isSwitched,
                activeColor: AppTheme.primaryColor,
                onChanged: (val) {
                  setState(() {
                    isSwitched = val;
                  });
                }),

            ListTile(
              title: Text("Logout"),
              onTap: () {
                Navigator.of(context).popUntil((route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
