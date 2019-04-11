import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import '../widgets/teddy_fab.dart';

class TeddyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TeddyState();
  }
}

class _TeddyState extends State<TeddyPage> {
  String _currentAnimation = "idle";
  String path;
  List<String> _animations = List<String>();

  @override
  initState() {
    path = "assets/animation/teddy.flr";
    _animations.addAll(["success", "fail", "idle", "test"]);
    super.initState();
  }

  void nextAnimation() {
    setState(() {
      var index = _animations.indexOf(_currentAnimation);
      if (index < _animations.length - 1) {
        _currentAnimation = _animations[index + 1];
      } else {
        _currentAnimation = _animations[0];
      }
    });
  }

  void previousAnimation() {
    setState(() {
      var index = _animations.indexOf(_currentAnimation);
      if (index != 0) {
        _currentAnimation = _animations[index - 1];
      } else {
        _currentAnimation = _animations[_animations.length - 1];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: <Widget>[
          Expanded(
              child: new FlareActor(path,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitHeight,
                  animation: _currentAnimation)),
        ]),
      ),
      floatingActionButton: TeddyFAB(nextAnimation, previousAnimation),
    );
  }
}
