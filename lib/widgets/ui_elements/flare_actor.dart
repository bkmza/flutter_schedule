import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FlareActorContainer extends StatelessWidget {
  final String path;

  FlareActorContainer(this.path);

  @override
  Widget build(BuildContext context) {
    return new FlareActor(path,
        alignment: Alignment.center, fit: BoxFit.contain, animation: "human_1");
  }
}
