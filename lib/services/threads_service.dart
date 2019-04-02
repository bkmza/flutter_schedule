import 'package:flutter/material.dart';
import '../shared/global_config.dart';
import 'package:sprintf/sprintf.dart';
import '../models/thread_model.dart';

abstract class BaseThreadService {
  List<ThreadModel> getThreads();
}
class ThreadService implements BaseThreadService {
  List<ThreadModel> getThreads() {
    List<ThreadModel> threads = new List<ThreadModel>();
    threads.add(ThreadModel(id: "1", name: "Technology", description: "desc 1", imageURL: "assets/cartman.svg"));
    threads.add(ThreadModel(id: "2",name: "People", description: "desc 2", imageURL: "assets/cartman.svg"));
    threads.add(ThreadModel(id: "3",name: "Workshops", description: "desc 3", imageURL: "assets/cartman.svg"));
    return threads;
  }
}

class ThreadServiceMock implements BaseThreadService {
  List<ThreadModel> getThreads() {
    List<ThreadModel> threads = new List<ThreadModel>();
    threads.add(ThreadModel(id: "1", name: "Technology", description: "desc 1", imageURL: "assets/cartman.svg"));
    threads.add(ThreadModel(id: "2",name: "People", description: "desc 2", imageURL: "assets/cartman.svg"));
    threads.add(ThreadModel(id: "3",name: "Workshops", description: "desc 3", imageURL: "assets/cartman.svg"));
    return threads;
  }
}
