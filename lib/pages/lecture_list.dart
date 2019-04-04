import 'package:flutter/material.dart';
import '../widgets/lectures.dart';
import '../services/global_service.dart';
import '../widgets/lecture_card.dart';

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
              expandedHeight: 256.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Schedules"),
                background: Hero(
                  tag: widget.threadId,
                  child: widget.service.imageService
                      .getThreadLogo("assets/threads/thread_tech_image.jpg"),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(widget.service.lectureService
                    .lecturesForThread(widget.threadId)
                    .map((item) => LectureCard(item))
                    .toList()))
          ],
        ),
      ),
    );
  }
}
