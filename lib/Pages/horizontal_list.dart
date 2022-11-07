import 'package:flutter/material.dart';

void main() => runApp(const MyHorizontalListApp());

class MyHorizontalListApp extends StatelessWidget {
  const MyHorizontalListApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Horizontal List';

    late double boxWidth = 300;
    return Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: boxWidth,
                color: Colors.red,
              ),
              Container(
                width: boxWidth,
                color: Colors.blue,
              ),
              Container(
                width: boxWidth,
                color: Colors.green,
              ),
              Container(
                width: boxWidth,
                color: Colors.yellow,
              ),
              Container(
                width: boxWidth,
                color: Colors.orange,
              ),
            ],
          ),
        ),
    );
  }
}