import 'package:flutter/material.dart';
import '../shared/global_config.dart';
import '../widgets/ui_elements/svg_network_image.dart';
import 'package:sprintf/sprintf.dart';

class ImageService {
  Widget getJoeschmoeAvatar(String name) {
    return SvgNetworkImage(
        sprintf("%s/%s", [joeschmoeAPI, name.toLowerCase()]));
  }
}
