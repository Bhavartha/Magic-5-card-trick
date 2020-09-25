import 'package:scratcher/scratcher.dart';
import 'package:flutter/material.dart';

class Magic extends StatelessWidget {
  final String cardName;
  Magic(this.cardName);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Swipe below to reveal card",
                textScaleFactor: 1.45,
                style: TextStyle(fontFamily: "Permanent", color: Colors.white),
              ),
              ScratchCard(screenSize: screenSize, cardName: cardName),
            ],
          ),
        ),
      ),
    );
  }
}

class ScratchCard extends StatelessWidget {
  const ScratchCard({
    Key key,
    @required this.screenSize,
    @required this.cardName,
  }) : super(key: key);

  final Size screenSize;
  final String cardName;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              border: Border.all(width: 1.8, color: Colors.white)),
          child: Scratcher(
            imagePath: 'assets/PNG/ccc.png',
            imageFit: BoxFit.cover,
            brushSize: 40,
            color: Colors.transparent,
            accuracy: ScratchAccuracy.low,
            child: Image.asset('assets/PNG/$cardName.png',
                width: screenSize.width * 0.85),
          ),
        ),
      ),
    );
  }
}
