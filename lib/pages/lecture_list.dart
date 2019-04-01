import 'package:flutter/material.dart';
import '../widgets/lectures.dart';

class LectureListPage extends StatefulWidget {
  final String threadId;

  LectureListPage(this.threadId);

  @override
  State<StatefulWidget> createState() {
    return _LectureListState();
  }
}

class _LectureListState extends State<LectureListPage> {
  @override
  initState() {
    super.initState();
  }

  Widget _buildList() {
    return Lectures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Schedule",
          ),
          backgroundColor: Theme.of(context).accentColor,
        ),
      body: _buildList(),
    );
  }
}
