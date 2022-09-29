import 'package:flutter/material.dart';
import 'package:flutbert/tabular.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MyAlign(),
      )
  );
}

class MyAlign extends StatefulWidget {
  const MyAlign({super.key});

  @override
  State<MyAlign> createState() => _MyAlign();
}

class _MyAlign extends State<MyAlign>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
          title: const Text('Align Sample'),
        ),
        body: const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: _Box(),
        ),
    );
  }
}

class _Box extends StatelessWidget{
  const _Box({super.key});

  @override
  Widget build(BuildContext context){
    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        width: 150,
        height: 50,
        decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(20)),
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
