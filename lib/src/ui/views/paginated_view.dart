import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reusables/reusables.dart';

class PaginatedViewController<T> extends ChangeNotifier {
  PaginatedViewController({this.restAction});

  List<T> _data = [];

  var _search = '';
  var _isLoading = false;
  var _limit = 10;
  var _offset = 0;

  final Future<List<T>> Function(int limit, int offSet, String search)
      restAction;

  Future<void> load({int limit, int offset}) async {
    _isLoading = true;
    notifyListeners();
    final _result =
        await restAction(limit ?? _limit, offset ?? _offset, search);
    if (_result.isNotEmpty) {
      if (search.isNotEmpty) {
        _data = _result;
      } else
        _data.addAll(_result);
      _offset += _limit;
    } else {
      if (search.isNotEmpty) _data = [];
    }
    _isLoading = false;
    notifyListeners();
  }

  String get search => _search;

  set search(String value) {
    _search = value;
    load(limit: 10, offset: 0);
  }
}

class PaginatedView<T> extends ControlledWidget<PaginatedViewController> {
  final PaginatedViewController controller;
  final Function(BuildContext context, T item) builder;

  PaginatedView({this.controller, this.builder})
      : assert(controller != null),
        super(controller: controller);

  @override
  _PaginatedViewState createState() => _PaginatedViewState();
}

class _PaginatedViewState extends ControlledWidgetState<PaginatedView> {
  @override
  void initState() {
    super.initState();
    widget.controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (!widget.controller._isLoading &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                setState(() => widget.controller._isLoading = true);
                widget.controller.load();
              }
              return true;
            },
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: widget.controller._data.length,
              itemBuilder: (context, index) => widget.builder(
                context,
                widget.controller._data[index],
              ),
            ),
          ),
        ),
        Container(
          height: widget.controller._isLoading ? 50.0 : 0,
          color: Colors.transparent,
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
      ],
    );
  }
}
