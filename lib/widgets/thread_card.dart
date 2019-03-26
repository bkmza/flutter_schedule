import 'package:flutter/material.dart';
import '../models/thread_model.dart';

class ThreadCard extends StatelessWidget {
  final ThreadModel threadModel;

  ThreadCard(this.threadModel);

  Widget _buildTitleRow() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Text(threadModel.name),
            ),
          ],
        ));
  }

  Widget _buildLogoRow() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Text(threadModel.name),
            ),
          ],
        ));
  }

  Widget _buildDescriptionRow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          Text(threadModel.description)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          _buildTitleRow(),
          SizedBox(
            height: 5.0,
          ),
          _buildLogoRow(),
          SizedBox(
            height: 5.0,
          ),
          _buildDescriptionRow(),
        ],
      ),
    );
  }
}
