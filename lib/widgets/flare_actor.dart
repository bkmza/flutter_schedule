import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FlareActorContainer extends StatefulWidget {
  final String path;
  final String initialAnimation;

  FlareActorContainer(this.path, this.initialAnimation);

  @override
  _FlareActorContainerState createState() => new _FlareActorContainerState();
}

class _FlareActorContainerState extends State<FlareActorContainer> {
  String _currentAnimation;

  @override
  initState() {
    _currentAnimation = widget.initialAnimation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new FlareActor(widget.path,
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: _currentAnimation);
  }
}
