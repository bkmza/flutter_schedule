import 'package:flutter/material.dart';
import '../models/thread_model.dart';
import '../widgets/thread_card.dart';

class Threads extends StatelessWidget {
  Widget _buildList(List<ThreadModel> threads, Function selectName) {
    Widget nameCard = ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new InkWell(
            onTap: () {
              String selectedName = threads[index].name;
              selectName(selectedName);
              Navigator.pushNamed<bool>(context, '/thread/' + selectedName)
                  .then((_) => selectName(null));
            },
            child: ThreadCard(threads[index]));
      },
      itemCount: threads.length,
    );
    return nameCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(
        ThreadModel.generateThreads(),
        (String name) => {});
  }
}
