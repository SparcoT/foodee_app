import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:group_list_view/group_list_view.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  Map<String, List> _elements = {
    'Today': [' Lewis', 'Ehsan Woodard', 'River '],
    'Last Week': [' Lewis', 'Ehsan Woodard', 'River '],
    'Last Month': [' Lewis', 'Ehsan Woodard', 'River '],
    'Last Year': [' Lewis', 'Ehsan Woodard', 'River '],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: AppTheme.secondaryColor,elevation: 0,centerTitle: true,
      ),
      body: GroupListView(
        physics: BouncingScrollPhysics(),
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
              backgroundColor: AppTheme.primaryColor,
              backgroundImage: NetworkImage(
                  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fdiscover%2F10-free-stock-images&psig=AOvVaw1vdDEaOgft_wPyxIjg5Xtp&ust=1616150352134000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLCqo6_Tue8CFQAAAAAdAAAAABAI"),
            ),
            subtitle: Text(
                " has cas has cas  has cas has cas  has cs has cas  has cas has cas has cas has cas  has cas has cas  has cas has cas  has cas has cas  has cas has cas has cas has cas  has cas has cas  has cas has cas  has cas has cas  has cas has cas "),
            title: Text(
              _elements.values.toList()[index.section][index.index],
            ),
          );
        },
        groupHeaderBuilder: (BuildContext context, int section) {
          return Container(
            color: AppTheme.secondaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                _elements.keys.toList()[section],
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
// sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
      ),
    );
  }
}
