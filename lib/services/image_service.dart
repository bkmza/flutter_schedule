import 'package:flutter/material.dart';
import '../shared/global_config.dart';
import '../widgets/ui_elements/svg_network_image.dart';
import '../widgets/ui_elements/svg_image.dart';
import 'package:sprintf/sprintf.dart';

abstract class BaseImageService {
  void getAvatar(String name);
}
class ImageService implements BaseImageService {
  Widget getAvatar(String name) {
    return SvgNetworkImage(
        sprintf("%s/%s", [joeschmoeAPI, name.toLowerCase()]));
  }
}

class ImageServiceMock implements BaseImageService {
  Widget getAvatar(String name) {
    return SvgImage("assets/cartman.svg");
  }
}
