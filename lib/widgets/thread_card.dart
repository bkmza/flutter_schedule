import 'package:flutter/material.dart';
import '../models/thread_model.dart';
import '../widgets/ui_elements/svg_image.dart';

class ThreadCard extends StatelessWidget {
  final ThreadModel threadModel;

  ThreadCard(this.threadModel);

  Widget _buildLogoRow() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: new Center(
                child: Text(threadModel.name),
              ),
            ),
          ],
        ));
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

  Widget _buildDescriptionRow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          Center(
            child: Text(
              threadModel.description,
              style: TextStyle(fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          _buildLogoRow(),
          _buildTitleRow(),
          _buildDescriptionRow(),
        ],
      ),
    );
  }
}
