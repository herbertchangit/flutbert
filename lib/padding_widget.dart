import 'package:flutter/material.dart';
import 'package:flutbert/tabular.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MyPadding(),
      )
  );
}

class MyPadding extends StatefulWidget {
  const MyPadding({super.key});

  @override
  State<MyPadding> createState() => _MyPadding();
}

class _MyPadding extends State<MyPadding>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
          title: const Text('Padding Sample'),
        ),
        body: const Padding(
          //padding: EdgeInsets.symmetric(vertical: 60,horizontal: 50),
          padding: EdgeInsets.fromLTRB(15, 15, 0, 20),
          child: _ListView(),
        ));
  }
}

class _ListView extends StatelessWidget{
  const _ListView({super.key});

  @override
  Widget build(BuildContext context){
    return ListView(
      scrollDirection: Axis.vertical, //text direction vertical or horizontal
      children: [
        for (var i = 0; i < 20; i++)
          ListTile(title: Text('row 放假啊雙方就打死解放了飛啊，解放東路撒嬌覅的撒 : ${i+1}'),),
      ],
    );
  }
}
