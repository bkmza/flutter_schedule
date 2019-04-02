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
}
