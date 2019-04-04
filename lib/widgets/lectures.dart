import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/lecture_model.dart';
import './lecture_card.dart';
import '../services/global_service.dart';

class Lectures extends StatelessWidget {
  final String threadId;

  Lectures(this.threadId);

  Widget _buildList(List<LectureModel> lectures) {
    Widget card;
    if (lectures.length > 0) {
      card = ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return LectureCard(lectures[index]);
        },
        itemCount: lectures.length,
      );
    } else {
      card = Center(
        child: Text('No speakers found, something went wrong'),
      );
    }
    return card;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalService>(
        builder: (BuildContext context, Widget widget, GlobalService service) {
      return _buildList(service.lectureService.lecturesForThread(threadId));
    });
  }
}
