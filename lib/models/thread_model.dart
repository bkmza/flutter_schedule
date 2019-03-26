import 'package:flutter/material.dart';

class ThreadModel {
  final String name;
  final String description;
  final String logo;

  ThreadModel(
      {@required this.name,
      @required this.description,
      @required this.logo});

  static List<ThreadModel> generateThreads() {
    List<ThreadModel> threads = new List<ThreadModel>();
    threads.add(ThreadModel(name: "Technology", description: "desc 1", logo: "logog 1"));
    threads.add(ThreadModel(name: "People", description: "desc 2", logo: "logog 2"));
    threads.add(ThreadModel(name: "Workshops", description: "desc 3", logo: "logog 3"));
    return threads;
  }
}