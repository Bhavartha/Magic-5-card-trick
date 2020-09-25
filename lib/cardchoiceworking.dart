import 'package:flutter/material.dart';

import 'magic.dart';

class CardChoice extends StatefulWidget {
  @override
  _CardChoiceState createState() => _CardChoiceState();
}

class _CardChoiceState extends State<CardChoice> {
  List<String> values = [
    'A',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    'J',
    'Q',
    'K'
  ];
  List<String> shapes = ['Club', 'Hearts', 'Spade', 'Diamond'];
  String v1, v2, v3, v4, s1, s2, s3, s4;

  String getSecret(String v1, String v2, String v3, String v4, String s1,
      String s2, String s3, String s4) {
    // int c1= ((values.indexOf(v1)+1)*10)+(4-shapes.indexOf(s1));
    int c2 = ((values.indexOf(v2) + 1) * 10) + (4 - shapes.indexOf(s2));
    int c3 = ((values.indexOf(v3) + 1) * 10) + (4 - shapes.indexOf(s3));
    int c4 = ((values.indexOf(v4) + 1) * 10) + (4 - shapes.indexOf(s4));
    int _;

    if (c2 < c3 && c2 < c4) //c2 is low
    {
      if (c3 < c4)
        _ = 0;
      else
        _ = 1;
    } else if (c2 > c3 && c2 > c4) //c2 is high
    {
      if (c3 < c4)
        _ = 4;
      else
        _ = 5;
    } else //c2 is mid
    {
      if (c3 < c4)
        _ = 2;
      else
        _ = 3;
    }
    return '${values.elementAt((values.indexOf(v1) + 1 + _) % 13)}${s1[0]}';
  }

  bool check() {
    return !(s1 != null && s2 != null && s3 != null && s1 != null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Choose Cards')),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                DD('first', values, shapes, v1, s1, (_) {
                  setState(() {
                    v1 = _;
                  });
                }, (_) {
                  setState(() {
                    s1 = _;
                  });
                }),
                DD('second', values, shapes, v2, s2, (_) {
                  setState(() {
                    v2 = _;
                  });
                }, (_) {
                  setState(() {
                    s2 = _;
                  });
                }),
                DD('third', values, shapes, v3, s3, (_) {
                  setState(() {
                    v3 = _;
                  });
                }, (_) {
                  setState(() {
                    s3 = _;
                  });
                }),
                DD('fourth', values, shapes, v4, s4, (_) {
                  setState(() {
                    v4 = _;
                  });
                }, (_) {
                  setState(() {
                    s4 = _;
                  });
                }),
                Container(
                    padding: EdgeInsets.all(15),
                    child: OutlineButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        shape: StadiumBorder(),
                        borderSide: BorderSide(width: 1.5),
                        child: Text("Reveal the last card",
                            style: TextStyle(
                                fontFamily: "Permanent", fontSize: 15)),
                        onPressed: check()
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Magic(getSecret(
                                          v1, v2, v3, v4, s1, s2, s3, s4))),
                                );
                              }))
              ],
            ),
          ),
        ));
  }
}

class DD extends StatefulWidget {
  final List<String> values, shapes;
  final String valSelector, shapeSelector, cardNo;
  final Function onValChanged, onShapeChanged;
  DD(this.cardNo, this.values, this.shapes, this.valSelector,
      this.shapeSelector, this.onValChanged, this.onShapeChanged);
  @override
  _DDState createState() => _DDState();
}

class _DDState extends State<DD> {
  @override
  Widget build(BuildContext context) {
    String _image = (widget.shapeSelector != null)
        ? '${widget.valSelector}${widget.shapeSelector[0]}'
        : 'ccc';
    return Container(
      padding: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Center(
                child: Text("Choose ${widget.cardNo} card",
                    style: TextStyle(fontFamily: "Permanent", fontSize: 20)),
              ),
            ),
            Divider(),
            Container(
                padding: EdgeInsets.all(15),
                child: Image.asset('assets/PNG/$_image.png')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                DropdownButton(
                  hint: Text("Value",
                      style: TextStyle(
                        fontFamily: "Permanent",
                      )), // Not necessary for Option 1
                  value: widget.valSelector,
                  onChanged: widget.onValChanged,
                  items: widget.values.map((_) {
                    return DropdownMenuItem(
                      child: Center(child: Text(_)),
                      value: _,
                    );
                  }).toList(),
                ),
                DropdownButton(
                  hint: Text("Shape",
                      style: TextStyle(
                        fontFamily: "Permanent",
                      )), // Not necessary for Option 1
                  value: widget.shapeSelector,
                  onChanged:
                      widget.valSelector == null ? null : widget.onShapeChanged,
                  items: widget.shapes.map((_) {
                    return DropdownMenuItem(
                      child: Center(child: Text(_)),
                      value: _,
                    );
                  }).toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
