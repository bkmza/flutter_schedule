import 'package:flutter/material.dart';
import '../models/thread_model.dart';
import '../models/lecture_model.dart';
import './lecture_card.dart';

class Lectures extends StatelessWidget {
  Widget _buildList(List<LectureModel> lectures, Function selectName) {
    Widget nameCard = ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new InkWell(
            onTap: () {
              String selectedLectureId = lectures[index].id;
              Navigator.pushNamed<bool>(
                      context, '/lecture/' + selectedLectureId)
                  .then((_) => selectName(null));
            },
            child: LectureCard(lectures[index]));
      },
      itemCount: lectures.length,
    );
    return nameCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(LectureModel.generateLectures(), (String name) => {});
  }
}