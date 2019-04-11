import 'package:flutter/material.dart';

class ThreadModel {
  final String id;
  final String name;
  final String imageURL;
  String animatedImageURL;
  String animationName;

  ThreadModel(
      {@required this.id,
      @required this.name,
      @required this.imageURL,
      this.animatedImageURL,
      this.animationName});
}