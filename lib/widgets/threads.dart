import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/thread_model.dart';
import '../widgets/thread_card.dart';
import '../services/global_service.dart';

class Threads extends StatelessWidget {
  Widget _buildList(List<ThreadModel> threads) {
    Widget card;
    if (threads.length > 0) {
      card = ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
              onTap: () {
                String name = threads[index].name;
                Navigator.pushNamed<bool>(context, '/thread/' + name);
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
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalService>(
        builder: (BuildContext context, Widget widget, GlobalService service) {
      return _buildList(service.threadService.threads);
    });
  }
}
