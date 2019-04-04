import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  final String path;

  SvgImage(this.path);

  @override
  Widget build(BuildContext context) {
    return new SvgPicture.asset(
      path,
      width: 300.0,
    );
  }
}
