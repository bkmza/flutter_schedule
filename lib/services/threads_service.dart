import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../shared/global_config.dart';
import 'package:sprintf/sprintf.dart';
import '../models/thread_model.dart';

abstract class BaseThreadService {
  List<ThreadModel> getThreads();
}

class ThreadService implements BaseThreadService {
  List<ThreadModel> _threads = new List<ThreadModel>();

  List<ThreadModel> getThreads() {
    fetchThreads();
    return _threads;
  }

  Future<Null> fetchThreads() {
    return http
        .get('https://flutter-schedule.firebaseio.com/threads.json')
        .then<Null>((http.Response response) {
      final List<ThreadModel> fetchedThreadList = [];
      final Map<String, dynamic> threadListData = json.decode(response.body);
      if (threadListData == null) {
        return;
      }
      threadListData.forEach((String key, dynamic data) {
        if (key == 'results') {
          List<Map<String, dynamic>> resultList = List.from(data);
          resultList.forEach((item) {
            fetchedThreadList.add(ThreadModel(
                id: item['id'],
                name: item['name'],
                imageURL: item['imageURL']));
          });
        }
      });
      _threads = fetchedThreadList;
    }).catchError((error) {
      print(error.toString());
    });
  }
}

class ThreadServiceMock implements BaseThreadService {
  List<ThreadModel> getThreads() {
    List<ThreadModel> threads = new List<ThreadModel>();
    threads.add(ThreadModel(
        id: "1",
        name: "Technology",
        imageURL: "assets/threads/thread_tech_image.jpg"));
    threads.add(ThreadModel(
        id: "2",
        name: "People",
        imageURL: "assets/threads/thread_people_image.jpg"));
    threads.add(ThreadModel(
        id: "3",
        name: "Workshops",
        imageURL: "assets/threads/thread_workshop_image.jpg"));
    return threads;
  }
}
