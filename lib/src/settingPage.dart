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
              //trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text("Contact Us"),
              //trailing: Icon(Icons.arrow_forward_ios),
            ),
            SwitchListTile(
                title: Text("Notifications on"),
                value: isSwitched,
                activeColor: AppTheme.primaryColor,
                onChanged: (val) {
                  setState(() {
                    isSwitched = val;
                  });
                }),
            // CheckboxListTile(
            //     title: Text("Push Notifications"),
            //     activeColor: AppTheme.primaryColor,
            //     value: isCheck,
            //     onChanged: (newCheck) {
            //       setState(() {
            //         isCheck = newCheck;
            //       });
            //     }),

            ListTile(
              title: Text("Logout"),
              //trailing: Icon(Icons.logout),
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
