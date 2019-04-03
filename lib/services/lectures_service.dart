import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../models/lecture_model.dart';
import './global_service.dart';

abstract class BaseLectureService {
  void fetch();
  List<LectureModel> lectures;
}

class LectureService implements BaseLectureService {
  final GlobalService globalService;
  List<LectureModel> lectures = List<LectureModel>();
  LectureService(this.globalService) {
    fetch();
  }
  void fetch() {
    fetchLectures();
  }

  Future<Null> fetchLectures() {
    return http
        .get('https://flutter-schedule.firebaseio.com/lectures.json')
        .then<Null>((http.Response response) {
      final List<LectureModel> fetchedList = [];
      final Map<String, dynamic> data = json.decode(response.body);
      if (data == null) {
        globalService.notify();
        return;
      }
      data.forEach((String key, dynamic data) {
        if (key == 'results') {
          List<Map<String, dynamic>> resultList = List.from(data);
          resultList.forEach((item) {
            fetchedList.add(
              LectureModel(
                id: item['id'],
                threadId: item['threadId'],
                speakerName: item['speakerName'],
                title: item['title'],
                description: item['description'],
                startTime: DateTime.parse(item['startTime']),
                endTime: DateTime.parse(item['endTime']),
              ),
            );
          });
        }
      });
      lectures = fetchedList;
      globalService.notify();
    }).catchError((error) {
      print(error.toString());
      globalService.notify();
    });
  }
}

class LectureServiceMock implements BaseLectureService {
  List<LectureModel> lectures;

  LectureServiceMock() {
    lectures = List<LectureModel>();
    fetch();
  }

  void fetch() {
    List<LectureModel> schedules = new List<LectureModel>();
    for (var i = 0; i < 24; i++) {
      DateTime startTime =
          DateTime(2019, 06, 1, 10, 00).add(Duration(minutes: i * 60));
      DateTime endTime = startTime.add(Duration(minutes: 40));
      schedules.add(LectureModel(
          id: i.toString(),
          threadId: (i % 8 + 1).toString(),
          speakerName: speakerNameSet.elementAt(i),
          title: lectureTopicsMap.keys.toList()[i],
          description: lectureTopicsMap.values.toList()[i],
          startTime: startTime,
          endTime: endTime));
    }
    lectures = schedules;
  }

  final speakerNameSet = const {
    'jack',
    'jacques',
    'jai',
    'jake',
    'james',
    'jana',
    'jaqueline',
    'jean',
    'jed',
    'jenni',
    'jeri',
    'jerry',
    'jess',
    'jocelyn',
    'jodi',
    'joe',
    'jolee',
    'jon',
    'jordan',
    'josephine',
    'josh',
    'jude',
    'julie',
    'jazebelle'
  };

  final lectureTopicsMap = const {
    'Living in a technological world':
        'What are the long-term effects of living in a technological world? Are these mostly negative or positive?',
    'World problems':
        'What is the most important new technology for solving world problems?',
    'Make the world bigger':
        'How do social media, texting, cell phones, and the Internet make the world bigger? Smaller?',
    'Technology is changing so quickly':
        'Technology is changing so quickly that we are frequently using computers, software programs, and other technologies that have frustrating glitches and problems. Is there a solution?',
    'Digital learning':
        'How is digital learning going to change schools and education?',
    'How will technology change our lives in twenty years?':
        'Should people get identity chips implanted under their skin? How are brains different from computers?',
    'Self-driving vehicles':
        'Would having cars that drive themselves be a good or bad idea?',
    'Work from home':
        'Should information technologies and Internet availability make work from home the norm?',
    'Relationships':
        'Has social media changed our relationships in a good or bad way?',
    'Social media':
        'How important is it to monitor and limit our social media intake?',
    'Technology addiction':
        'Is addiction to technology something we should worry about?',
    'When is texting rude':
        'When is texting rude? Has texting made this generation less respectful of other people? Who decides?',
    'Social networking profiles':
        'How should people manage their social networking profiles? How important is this?',
    'Internet':
        'What is the next level for the Internet? How can the Internet be changed to make it better?',
    'Computer language':
        'If there is a new computer language to be invented, what does it need to do to be better than the languages we now have?',
    'Robots': 'How are robots changing health care?',
    'Performance management': '',
    'Team collaboration and project management': '',
    'Developing purpose and value inside an organization': '',
    'Agile methodologies': '',
    'Self-organization and delegation': '',
    'Change management and organizational transformation': '',
    'Extrinsic motivation vs. intrinsic motivation': '',
    'Organizational hierarchy': '',
  };
}
