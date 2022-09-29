import 'package:flutter/material.dart';
import 'package:flutbert/tabular.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MyListView(),
      )
  );
}

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListView();
}

class _MyListView extends State<MyListView>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
          title: const Text('ListView Sample'),
        ),
        body: ListView(
          scrollDirection: Axis.vertical, //text direction vertical or horizontal
          children: [
            for (var i = 0; i < 50; i++)
              if(i%2==0)(
                  ListTile(title: Text('Line number ${i+1}', style: const TextStyle(color: Colors.lightGreen),),)
                )
              else(
                  ListTile(title: Text('Line number ${i+1}', style: const TextStyle(color: Colors.indigo, backgroundColor: Colors.pinkAccent),),)
                )
          ],
        ));
  }
}
