import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flare_flutter/flare_actor.dart';

import '../../services/global_service.dart';
import '../../models/thread_model.dart';

class ThreadSliderPage extends StatefulWidget {
  final GlobalService service;

  ThreadSliderPage(this.service);

  @override
  State<StatefulWidget> createState() {
    return _TreadSliderState();
  }
}

class _TreadSliderState extends State<ThreadSliderPage> {
  var currentPage;

  @override
  initState() {
    currentPage = widget.service.threadService.threads.length - 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(
        initialPage: widget.service.threadService.threads.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            CardSliderWidget(currentPage,
                widget.service.threadService.threads.reversed.toList()),
            Positioned.fill(
              child: PageView.builder(
                itemCount: widget.service.threadService.threads.length,
                controller: controller,
                reverse: true,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            ),
          ],
        ),
      ])),
    );
  }
}

class CardSliderWidget extends StatelessWidget {
  final List<ThreadModel> threads;
  var currentPage;
  final double padding = 20.0;
  final double verticalInset = 20.0;
  final double cardAspectRatio = 12.0 / 16.0;
  final double widgetAspectRatioFactor = 1.2;

  final List<Color> colors = List<Color>();

  CardSliderWidget(this.currentPage, this.threads) {
    colors.addAll([Colors.lightBlue, Colors.purple, Colors.white].reversed);
  }

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: cardAspectRatio * widgetAspectRatioFactor,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < threads.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: colors[i], boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      new FlareActor(threads[i].animatedImageURL,
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          animation: threads[i].animationName),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new RotationTransition(
                                turns: new AlwaysStoppedAnimation(-15 / 360),
                                child: Text(threads[i].name,
                                    style: TextStyle(
                                        color: colors[i], fontSize: 40.0)),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
