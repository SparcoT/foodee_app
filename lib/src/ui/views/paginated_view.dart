import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginatedView<T> extends StatefulWidget {
  final Future<List<T>> Function(int limit, int offSet) restAction;
  final int limit;
  final Function(BuildContext, T data) builder;

  PaginatedView({
    @required this.restAction,
    this.limit,
    @required this.builder,
  });

  @override
  _PaginatedViewState createState() => _PaginatedViewState();
}

class _PaginatedViewState extends State<PaginatedView> {
  var _isLoading = false;
  List<dynamic> _data = [];
  int _limit;
  var _offset = 0;

  @override
  void initState() {
    super.initState();
    _limit = widget.limit ?? 10;
    _getData();
  }

  _getData() async {
    final result = await widget.restAction(_limit, _offset);
    if (result.isNotEmpty) {
      _data.addAll(result);
      _offset += _limit;
    } else
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No data'),
        ),
      );
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (!_isLoading &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                setState(() => _isLoading = true);
                _getData();
              }
              return true;
            },
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _data.length,
              itemBuilder: (context, index) => widget.builder(
                context,
                _data[index],
              ),
            ),
          ),
        ),
        Container(
          height: _isLoading ? 50.0 : 0,
          color: Colors.transparent,
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
      ],
    );
  }
}
