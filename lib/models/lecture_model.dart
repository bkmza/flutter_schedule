import 'package:flutter/material.dart';

class LectureModel {
  final String id;
  final String threadId;
  final String speakerName;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;

  LectureModel(
      {@required this.id,
      @required this.threadId,
      @required this.speakerName,
      @required this.title,
      @required this.description,
      @required this.startTime,
      @required this.endTime});

  static List<LectureModel> generateLectures() {
    List<LectureModel> schedules = new List<LectureModel>();
    schedules.add(LectureModel(
        id: "1",
        threadId: "1",
        speakerName: "Jess",
        title: "Lecture Title 1",
        description: "desc 1",
        startTime: DateTime.now(),
        endTime: DateTime.now()));
    schedules.add(LectureModel(
        id: "2",
        threadId: "1",
        speakerName: "Josephine",
        title: "Lecture Title 2",
        description: "desc 2",
        startTime: DateTime.now(),
        endTime: DateTime.now()));
    schedules.add(LectureModel(
        id: "3",
        threadId: "1",
        speakerName: "Jazebelle",
        title: "Lecture Title 3",
        description: "desc 3",
        startTime: DateTime.now(),
        endTime: DateTime.now()));
    schedules.add(LectureModel(
        id: "4",
        threadId: "1",
        speakerName: "Josh",
        title: "Lecture Title 4",
        description: "desc 4",
        startTime: DateTime.now(),
        endTime: DateTime.now()));
    return schedules;
  }
}
