import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyGridListApp());
}

class MyGridListApp extends StatelessWidget {
  const MyGridListApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';
    final random = Random();

    return Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 3,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(102, (index) {
            return Container(
              color: Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256),1),
                child: Center(
                  child: Text(
                    'R: ${index+1}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
            );
          }),
        ),
    );
  }
}