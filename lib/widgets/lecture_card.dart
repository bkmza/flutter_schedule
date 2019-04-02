import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:date_format/date_format.dart';

import '../models/lecture_model.dart';
import '../services/global_service.dart';
import '../widgets/ui_elements/tag_default.dart';

class LectureCard extends StatelessWidget {
  final LectureModel lectureModel;
  final String defaultAvatarImagePath = 'assets/cartman.svg';

  LectureCard(this.lectureModel);

  Widget _buildSpeakerFaceRow(Function getAvatar) {
    return getAvatar(lectureModel.speakerName);
  }

  Widget _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: Center(
            child: Text(
              lectureModel.title,
              style: TextStyle(fontSize: 26.0),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIconTagRow(IconData icon, String text) {
    return Row(
      children: <Widget>[Icon(icon), SizedBox(width: 5), TagDefault(text)],
    );
  }

  Widget _buildDescriptionRow() {
    Widget descriptionRow = Row(
      children: <Widget>[
        Flexible(
          child: Center(
            child: Text(
              lectureModel.description,
              style: TextStyle(fontSize: 20.0),
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
            ),
          ),
        ),
      ],
    );
    return lectureModel.description.isNotEmpty ? descriptionRow : Container();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalService>(
      builder: (BuildContext context, Widget child, GlobalService service) {
        return Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                _buildSpeakerFaceRow(service.imageService.getAvatar),
                SizedBox(height: 15),
                _buildTitleRow(),
                SizedBox(height: 20),
                _buildIconTagRow(Icons.account_circle,
                    lectureModel.speakerName.toUpperCase()),
                SizedBox(height: 10),
                _buildIconTagRow(Icons.timer,
                    formatDate(lectureModel.startTime, [HH, ':', nn])),
                SizedBox(height: 10),
                _buildIconTagRow(Icons.timer_off,
                    formatDate(lectureModel.endTime, [HH, ':', nn])),
                SizedBox(height: 20),
                _buildDescriptionRow(),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
