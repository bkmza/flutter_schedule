import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/thread_model.dart';
import '../services/global_service.dart';

class ThreadCard extends StatelessWidget {
  final ThreadModel threadModel;

  ThreadCard(this.threadModel);

  Widget _buildLogoRow(Function getLogo) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: getLogo(threadModel.imageURL));
  }

  Widget _buildTitleRow() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Center(
                child: Text(
                  threadModel.name,
                  style: TextStyle(fontSize: 26.0),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalService>(
        builder: (BuildContext context, Widget widget, GlobalService service) {
      return Card(
        child: Column(
          children: <Widget>[
            _buildLogoRow(service.imageService.getThreadLogo),
            _buildTitleRow(),
          ],
        ),
      );
    });
  }
}
