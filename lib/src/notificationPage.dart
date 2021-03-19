import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Map<String, List> _elements = {
    'Today': ['Riley Reid', 'Ehsan Woodard', 'River Bains'],
    'Last Week': ['Leah Gotti', 'Ehsan Woodard', 'River Bains'],
    'Last Month': ['Alexas Crystal', 'Ehsan Woodard', 'River Bains'],
    'Earlier': ['Dani Daniels', 'Ehsan Woodard', 'River Bains'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Notifications'),
      ),
      body: GroupListView(
        sectionsCount: _elements.keys.toList().length,
        countOfItemInSection: (int section) {
          return _elements.values.toList()[section].length;
        },
        itemBuilder: (BuildContext context, IndexPath index) {
          return ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 2.5, horizontal: 10.0),
            dense: true,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fdiscover%2F10-free-stock-images&psig=AOvVaw1vdDEaOgft_wPyxIjg5Xtp&ust=1616150352134000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLCqo6_Tue8CFQAAAAAdAAAAABAI",
              ),
            ),
            subtitle: Text(
                " has cas cias cjkas cj asjc ajhk ck hkcas c sjk  acjk csjk "),
            title: Text(
              _elements.values.toList()[index.section][index.index],
            ),
          );
        },
        groupHeaderBuilder: (BuildContext context, int section) {
          return Container(
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                _elements.keys.toList()[section],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        // sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
      ),
    );
  }
}
