import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

import '../widgets/lectures.dart';
import '../services/global_service.dart';
import '../widgets/lecture_card.dart';
import '../models/thread_model.dart';

class LectureListPage extends StatefulWidget {
  final ThreadModel threadModel;
  final GlobalService service;

  LectureListPage(this.threadModel, this.service);

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
    return Lectures(widget.threadModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 250.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  sprintf("%s", [widget.threadModel.name.toUpperCase()]),
                  style: TextStyle(fontSize: 15),
                ),
                background: Hero(
                  tag: widget.threadModel.id,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
                    child: widget.service.imageService
                        .getThreadLogo(widget.threadModel.imageURL),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(widget.service.lectureService
                    .lecturesForThread(widget.threadModel.id)
                    .map((item) => LectureCard(item))
                    .toList()))
          ],
        ),
      ),
    );
  }
}
