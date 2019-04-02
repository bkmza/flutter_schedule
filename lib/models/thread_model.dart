import 'package:flutter/material.dart';

class ThreadModel {
  final String id;
  final String name;
  final String description;
  final String imageURL;

  ThreadModel(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.imageURL});
}