import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgNetworkImage extends StatelessWidget {
  final String url;

  SvgNetworkImage(this.url);

  @override
  Widget build(BuildContext context) {
    return new SvgPicture.network(
      url,
      semanticsLabel: 'Avatar',
      width: 300.0,
      placeholderBuilder: (BuildContext context) => new Container(
          padding: const EdgeInsets.all(30.0),
          child: const CircularProgressIndicator()),
    );
  }
}