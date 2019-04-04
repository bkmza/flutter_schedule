import 'package:flutter/material.dart';
import '../widgets/lectures.dart';
import '../services/global_service.dart';

class LectureListPage extends StatefulWidget {
  final String threadId;
  final GlobalService service;

  LectureListPage(this.threadId, this.service);

  @override
  State<StatefulWidget> createState() {
    return _LectureListState();
  }
}

class _LectureListState extends State<LectureListPage> {
  @override
  initState() {
    widget.service.lectureService.fetch();
    super.initState();
  }

  Widget _buildList() {
    return Lectures(widget.threadId);
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
