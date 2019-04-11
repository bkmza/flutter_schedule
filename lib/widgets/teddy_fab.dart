import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:scoped_model/scoped_model.dart';
import '../services/global_service.dart';

class TeddyFAB extends StatefulWidget {
  final Function nextAnimation;
  final Function previousAnimation;

  TeddyFAB(this.nextAnimation, this.previousAnimation);

  @override
  State<StatefulWidget> createState() {
    return _TeddyFABState();
  }
}

class _TeddyFABState extends State<TeddyFAB> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, GlobalService service) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 70.0,
              width: 56.0,
              alignment: FractionalOffset.topCenter,
              child: ScaleTransition(
                scale: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.0, 1.0, curve: Curves.easeOut),
                ),
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).cardColor,
                  heroTag: 'contact',
                  mini: true,
                  onPressed: widget.previousAnimation,
                  child: Icon(
                    Icons.arrow_left,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Container(
              height: 70.0,
              width: 56.0,
              alignment: FractionalOffset.topCenter,
              child: ScaleTransition(
                scale: CurvedAnimation(
                    parent: _controller,
                    curve: Interval(0.0, 1.0, curve: Curves.easeOut)),
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).cardColor,
                  heroTag: 'favorite',
                  mini: true,
                  onPressed: widget.nextAnimation,
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              heroTag: 'options',
              onPressed: () {
                if (_controller.isDismissed) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget widget) {
                  return Transform(
                    alignment: FractionalOffset.center,
                    transform:
                        Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                    child: Icon(_controller.isDismissed
                        ? Icons.more_vert
                        : Icons.close),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
