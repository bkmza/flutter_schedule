import 'package:flutter/material.dart';

class ThreadModel {
  final String id;
  final String name;
  final String description;
  final String logo;

  ThreadModel(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.logo});

  static List<ThreadModel> generateThreads() {
    List<ThreadModel> threads = new List<ThreadModel>();
    threads.add(ThreadModel(id: "1", name: "Technology", description: "desc 1", logo: "assets/human_animation.flr"));
    threads.add(ThreadModel(id: "2",name: "People", description: "desc 2", logo: "assets/human_animation.flr"));
    threads.add(ThreadModel(id: "3",name: "Workshops", description: "desc 3", logo: "assets/human_animation.flr"));
    return threads;
  }
}