import 'package:flutter/material.dart';
import 'package:flutbert/tabular.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MySizedBox(),
      )
  );
}

class MySizedBox extends StatefulWidget {
  const MySizedBox({super.key});

  @override
  State<MySizedBox> createState() => _MySizedBox();
}

class _MySizedBox extends State<MySizedBox>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
          title: const Text('Center SizedBox Sample'),
        ),
        body: const Center(
          child: _SizedBox(),
        ));
  }
}

class _SizedBox extends StatelessWidget{
  const _SizedBox({super.key});
  @override
  Widget build(BuildContext context){
    return const SizedBox(
      width: 200,
      height: 600,
      child: _ListView(),
    );
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
