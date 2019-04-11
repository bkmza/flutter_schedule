import 'package:flutter/material.dart';
import 'package:nima/nima_actor.dart';

class SpeakersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SpeakersState();
  }
}

class _SpeakersState extends State<SpeakersPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new NimaActor("assets/animation/Robot",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "Flight"));
  }
}
