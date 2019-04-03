import 'package:flutter/material.dart';
import '../shared/global_config.dart';
import '../widgets/ui_elements/svg_network_image.dart';
import '../widgets/ui_elements/svg_image.dart';
import 'package:sprintf/sprintf.dart';

abstract class BaseImageService {
  Widget getAvatar(String name);
  Widget getThreadLogo(String path);
}

class ImageService implements BaseImageService {
  Widget getAvatar(String name) {
    return SvgNetworkImage(
        sprintf("%s/%s", [joeschmoeAPI, name.toLowerCase()]));
  }

  Widget getThreadLogo(String path) {
    return FadeInImage(
      height: 250.0,
      fit: BoxFit.cover,
      placeholder: AssetImage('assets/threads/thread_default_image.jpg'),
      image: NetworkImage(path),
    );
  }
}

class ImageServiceMock implements BaseImageService {
  Widget getAvatar(String name) {
    return SvgImage(sprintf("assets/speakers/%s.svg", [name.toLowerCase()]));
  }

  Widget getThreadLogo(String path) {
    return Image.asset(path);
  }
}
