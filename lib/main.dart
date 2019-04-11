import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/home.dart';
import './pages/settings/settings.dart';
import './pages/lectures/lecture_list.dart';
import './services/global_service.dart';
import './helpers/custom_route.dart';
import './shared/adaptive_theme.dart';
import './models/thread_model.dart';

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
        theme: getAdaptiveThemeData(context),
        routes: {'/': (BuildContext context) => HomePage(_service)},
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'thread') {
            final String threadId = pathElements[2];
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => LectureListPage(
                  _service.threadService.threads
                      .firstWhere((ThreadModel item) => item.id == threadId),
                  _service),
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
