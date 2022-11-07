import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MyColumn(),
      )
  );
}

class MyColumn extends StatefulWidget {
  const MyColumn({super.key});

  @override
  State<MyColumn> createState() => _MyColumn();
}

class _MyColumn extends State<MyColumn>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
          title: const Text('Column Sample'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            for (var i = 0; i < 10; i++)
                ListTile(title: Text('row : ${i+1}'),),
          ],
        )
    );
  }
}
