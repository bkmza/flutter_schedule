import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/home.dart';
import './pages/lecture_list.dart';
import './pages/settings/settings.dart';
import './services/global_service.dart';
import './helpers/custom_route.dart';

void main() {
  runApp(ScheduleApp());
}

class ScheduleApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // debugPaintBaselinesEnabled = true;
    return _State();
  }
}

class _State extends State<ScheduleApp> {
  final GlobalService _service = GlobalService();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<GlobalService>(
      model: _service,
      child: MaterialApp(
        routes: {'/': (BuildContext context) => HomePage(_service)},
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'thread') {
            final String threadId = pathElements[2];
            return CustomRoute<bool>(
              builder: (BuildContext context) => LectureListPage(threadId, _service),
            );
          }
          if (pathElements[1] == 'settings') {
            return CustomRoute<bool>(
              builder: (BuildContext context) =>
                  SettingsPage(_service.isOfflineMode),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => HomePage(_service));
        },
      ),
    );
  }
}
