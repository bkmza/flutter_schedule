import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/thread_model.dart';
import '../../services/global_service.dart';

class ThreadListPage extends StatefulWidget {
  final GlobalService _service;

  ThreadListPage(this._service);

  @override
  State<StatefulWidget> createState() {
    return _TreadListState();
  }
}

class _TreadListState extends State<ThreadListPage> {
  @override
  initState() {
    widget._service.threadService.fetch();
    super.initState();
  }

  Widget _buildList() {
    Widget content;
    content = Threads();
    return RefreshIndicator(
      onRefresh: widget._service.lectureService.fetch,
      child: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList(),
    );
  }
}

class Threads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalService>(
        builder: (BuildContext context, Widget widget, GlobalService service) {
      Widget card;
      List<ThreadModel> threads = service.threadService.threads;
      if (threads.length > 0) {
        card = ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new InkWell(
                onTap: () {
                  Navigator.pushNamed<bool>(
                      context, '/thread/' + threads[index].id);
                },
                child: ThreadCard(threads[index]));
          },
          itemCount: threads.length,
        );
      } else {
        card = Center(
          child: Text('No threads found, something went wrong'),
        );
      }
      return card;
    });
  }
}

class ThreadCard extends StatelessWidget {
  final ThreadModel threadModel;

  ThreadCard(this.threadModel);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalService>(
        builder: (BuildContext context, Widget widget, GlobalService service) {
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side:
                BorderSide(width: 0.5, color: Color.fromRGBO(46, 157, 180, 1))),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Hero(
                tag: threadModel.id,
                child: service.imageService.getThreadLogo(threadModel.imageURL),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      threadModel.name.toUpperCase(),
                      style: TextStyle(fontSize: 26.0),
                    ),
                  ],
                )),
          ],
        ),
      );
    });
  }
}
