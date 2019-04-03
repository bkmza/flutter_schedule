import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../pages/thread_list.dart';
import '../pages/contacts.dart';
import '../pages/speakers.dart';
import '../services/global_service.dart';

class HomePage extends StatefulWidget {
  final GlobalService service;

  HomePage(this.service);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _children;

  @override
  initState() {
    _children = [
      ThreadListPage(widget.service),
      SpeakersPage(),
      ContactsPage()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'),
        actions: <Widget>[
          ScopedModelDescendant<GlobalService>(
            builder:
                (BuildContext context, Widget widget, GlobalService service) {
              return IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => {
                      Navigator.pushNamed<bool>(context, '/settings'),
                    },
              );
            },
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.schedule),
            title: new Text('Schedule'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.people),
            title: new Text('Speakers'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Contacts'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
