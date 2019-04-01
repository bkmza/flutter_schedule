import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  final String path;

  SvgImage(this.path);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
      child: new Center(
        child: new SvgPicture.asset(
          path,
        ),
      ),
    );
  }
}
