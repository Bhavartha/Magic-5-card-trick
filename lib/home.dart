import 'package:flutter/material.dart';

import 'cardchoice.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xff2d3447),
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              child: Text("Magic",
                  style: TextStyle(fontFamily: "Monoton", fontSize: 75))),
          Container(
            padding: EdgeInsets.only(top: 55),
            child: Text("Fitch Cheney's 5 card trick\n\n -By Bhavartha Khawale",
                style: TextStyle(fontFamily: "Permanent", fontSize: 20)),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 50),
              alignment: Alignment.bottomCenter,
              child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: StadiumBorder(),
                  borderSide: BorderSide(width: 2),
                  child: Text("Start",
                      style: TextStyle(fontFamily: "Permanent", fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scaffold(
                              // key: _sk,
                              appBar: AppBar(title: Text('Choose Cards')),
                              body: CardChoice())),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
