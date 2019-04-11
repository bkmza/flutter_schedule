import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../models/thread_model.dart';
import './global_service.dart';

abstract class BaseThreadService {
  List<ThreadModel> threads;
  List<ThreadModel> fetch();
}

class ThreadService implements BaseThreadService {
  GlobalService globalService;

  ThreadService(this.globalService) {
    fetch();
  }

  List<ThreadModel> threads = new List<ThreadModel>();

  List<ThreadModel> fetch() {
    fetchThreads();
    return threads;
  }

  Future<Null> fetchThreads() {
    return http
        .get('https://flutter-schedule.firebaseio.com/threads.json')
        .then<Null>((http.Response response) {
      final List<ThreadModel> fetchedThreadList = [];
      final Map<String, dynamic> threadListData = json.decode(response.body);
      if (threadListData == null) {
        globalService.notify();
        return;
      }
      threadListData.forEach((String key, dynamic data) {
        if (key == 'results') {
          List<Map<String, dynamic>> resultList = List.from(data);
          resultList.forEach((item) {
            fetchedThreadList.add(ThreadModel(
                id: item['id'],
                name: item['name'],
                imageURL: item['imageURL'],
                animatedImageURL: ""));
          });
        }
      });
      threads = fetchedThreadList;
      globalService.notify();
    }).catchError((error) {
      print(error.toString());
      globalService.notify();
    });
  }
}

class ThreadServiceMock implements BaseThreadService {
  List<ThreadModel> threads = new List<ThreadModel>();
  GlobalService globalService;

  ThreadServiceMock(this.globalService) {
    fetch();
  }

  List<ThreadModel> fetch() {
    threads = new List<ThreadModel>();
    threads.add(ThreadModel(
        id: "1",
        name: "Technology",
        imageURL: "assets/threads/thread_tech_image.jpg",
        animatedImageURL: "assets/animation/rocket.flr",
        animationName: "idle"));
    threads.add(ThreadModel(
        id: "2",
        name: "People",
        imageURL: "assets/threads/thread_people_image.jpg",
        animatedImageURL: "assets/animation/house.flr",
        animationName: "Demo Mode"));
    threads.add(ThreadModel(
        id: "3",
        name: "Workshops",
        imageURL: "assets/threads/thread_workshop_image.jpg",
        animatedImageURL: "assets/animation/nothing.flr",
        animationName: "peace"));
    globalService.notify();
    return threads;
  }
}
