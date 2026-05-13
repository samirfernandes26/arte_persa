import 'package:flutter/material.dart';

class DataFeedController<T> extends ChangeNotifier {
  final List<T> _data = [];

  List<T> get data => List.unmodifiable(_data);

  void appendData(List<T> items) {
    if (items.isEmpty) {
      return;
    }

    _data.addAll(items);
    notifyListeners();
  }

  void flushData() {
    _data.clear();
    notifyListeners();
  }
}

class LazyListViewWidget<T> extends StatefulWidget {
  const LazyListViewWidget({
    super.key,
    required this.controller,
    required this.itemBuilder,
    this.onRefresh,
    this.onReachingEnd,
  });

  final DataFeedController<T> controller;
  final Widget Function(BuildContext context, T data, int index) itemBuilder;
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onReachingEnd;

  @override
  State<LazyListViewWidget<T>> createState() => _LazyListViewWidgetState<T>();
}

class _LazyListViewWidgetState<T> extends State<LazyListViewWidget<T>> {
  bool _isLoadingMore = false;

  Future<void> _handleLoadMore() async {
    if (_isLoadingMore || widget.onReachingEnd == null) {
      return;
    }

    _isLoadingMore = true;
    try {
      await widget.onReachingEnd!.call();
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingMore = false;
        });
      } else {
        _isLoadingMore = false;
      }
    }
  }

  bool _onScroll(ScrollNotification notification) {
    if (notification.metrics.pixels >=
        notification.metrics.maxScrollExtent - 120) {
      _handleLoadMore();
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        final data = widget.controller.data;

        final listView = NotificationListener<ScrollNotification>(
          onNotification: _onScroll,
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return widget.itemBuilder(context, data[index], index);
            },
          ),
        );

        if (widget.onRefresh == null) {
          return listView;
        }

        return RefreshIndicator(
          onRefresh: widget.onRefresh!,
          child: listView,
        );
      },
    );
  }
}
