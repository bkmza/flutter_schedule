import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/lecture_model.dart';
import '../services/global_service.dart';

class LectureCard extends StatelessWidget {
  final LectureModel lectureModel;
  final String defaultAvatarImagePath = 'assets/cartman.svg';

  LectureCard(this.lectureModel);

  Widget _buildLogoRow(Function getAvatar) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: new Center(
                child: getAvatar(lectureModel.speakerName),
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
                  lectureModel.title,
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
              lectureModel.description,
              style: TextStyle(fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalService>(
      builder: (BuildContext context, Widget child, GlobalService service) {
        return Card(
          child: Column(
            children: <Widget>[
              _buildLogoRow(service.imageService.getAvatar),
              _buildTitleRow(),
              _buildDescriptionRow(),
            ],
          ),
        );
      },
    );
  }
}
