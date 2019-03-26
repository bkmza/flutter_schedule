import 'package:flutter/material.dart';

class ScheduleListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScheduleListState();
  }
}

class _ScheduleListState extends State<ScheduleListPage> {
  @override
  initState() {
    super.initState();
  }

  Widget _buildList() {
    Widget content = Center(child: Text('No items found.'));
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList(),
    );
  }
}
