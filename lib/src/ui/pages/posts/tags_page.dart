import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodee/src/base/theme.dart';
import 'package:foodee/src/data/data.dart';
import 'package:foodee/src/ui/views/paginated_view.dart';
import 'package:foodee/src/ui/widgets/shader_Text.dart';
import 'package:openapi/openapi.dart';

class TagsPage extends StatefulWidget {
  final List<User> selectedUsers;
  final Function(List<User>) onChanged;

  TagsPage({
    @required this.selectedUsers,
    @required this.onChanged,
  });

  @override
  _TagsPageState createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  List<User> _selectedUsers = [];
  Widget _child;

  _addOrRemove(User user, bool add) {
    if (add)
      _selectedUsers.add(user);
    else {
      if (_selectedUsers.contains(user)) _selectedUsers.remove(user);
    }
    setState(() {});
  }

  _getBuilder(ctx, user) {
    var _isSelected = _selectedUsers.contains(user);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              _addOrRemove(user, !_isSelected);
            },
            child: Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isSelected ? AppTheme.primaryColor : Colors.white,
                    border: Border.all(
                      color: _isSelected ? AppTheme.primaryColor : Colors.black,
                      width: 0.3,
                    ),
                  ),
                  child: _isSelected
                      ? Icon(
                          Icons.check,
                          size: 18.0,
                          color: Colors.white,
                        )
                      : null,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 10),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    backgroundImage: NetworkImage('${user.image}'),
                  ),
                ),
                Text(user.firstName),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedUsers = widget.selectedUsers;
    _child = PaginatedView(
      restAction: (a, b) async {
        var res = (await Openapi().getUsersApi().usersList(limit: a, offset: b))
            .data
            .results
            .toList();
        res = res
            .where((element) => element.id != AppData().getUserId())
            .toList();
        return res;
      },
      builder: _getBuilder,
    );
  }

  _searchUsers(String name) async {
    if (name.isNotEmpty) {
      print('Clicked here');
      _child = PaginatedView(
        restAction: (a, b) async {
          print(name);
          var res = (await Openapi()
                  .getUsersApi()
                  .usersList(limit: a, offset: b, search: name))
              .data
              .results
              .toList();
          res = res
              .where((element) => element.id != AppData().getUserId())
              .toList();
          return res;
        },
        builder: _getBuilder,
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.onChanged(_selectedUsers);
        return true;
      },
      child: Scaffold(
        appBar: CupertinoNavigationBar(
          middle: ShaderText(
            shaderText: "Add Tags",
          ),
          trailing: GestureDetector(
            child: Text('Done'),
            onTap: () {
              widget.onChanged(_selectedUsers);
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search..',
                ),
                textInputAction: TextInputAction.search,
                onFieldSubmitted: _searchUsers,
              ),
            ),
            if (_selectedUsers.isNotEmpty) Divider(),
            Wrap(
              children: _selectedUsers
                  .map((e) => TaggedUser(
                        name: e.firstName,
                        onDeleted: () => _addOrRemove(e, false),
                      ))
                  .toList(),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('All Friends'),
            ),
            Divider(),
            Expanded(
              child: _child,
            ),
          ],
        ),
      ),
    );
  }
}

class TaggedUser extends StatelessWidget {
  final String name;
  final Function onDeleted;

  TaggedUser({this.name, this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 3, 7, 3),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppTheme.secondaryColor.withOpacity(0.8),
        //      color: AppTheme.primaryColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
          SizedBox(width: 7),
          GestureDetector(
            onTap: onDeleted,
            child: Icon(
              CupertinoIcons.clear,
              size: 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
