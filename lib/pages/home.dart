import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../pages/threads/thread_list.dart';
import '../pages/threads/thread_slider.dart';
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
  bool _isListMode = true;
  List<Widget> _children;

  @override
  initState() {
    initPages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Insights',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        backgroundColor: Color.fromRGBO(46, 157, 180, 1),
        actions: <Widget>[
          ScopedModelDescendant<GlobalService>(
            builder:
                (BuildContext context, Widget widget, GlobalService service) {
              return IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () => {
                      Navigator.pushNamed<bool>(context, '/settings'),
                    },
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.cached,
              color: Colors.white,
            ),
            onPressed: changeViewMode,
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        fixedColor: Color.fromRGBO(46, 157, 180, 1),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.schedule),
            title: new Text('Schedule'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.accessibility),
            title: new Text('Fun'),
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

  void changeViewMode() {
    setState(() {
      _isListMode = !_isListMode;
      initPages();
    });
  }

  void initPages() {
    _children = [
      _isListMode
          ? ThreadListPage(widget.service)
          : ThreadSliderPage(widget.service),
      SpeakersPage(),
      ContactsPage()
    ];
  }
}
