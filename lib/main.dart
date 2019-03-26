import 'package:flutter/material.dart';
import './pages/thread_list.dart';

void main() {
  runApp(ScheduleApp());
}

class ScheduleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.schedule)),
                Tab(icon: Icon(Icons.people)),
                Tab(icon: Icon(Icons.map)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              ThreadListPage(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
