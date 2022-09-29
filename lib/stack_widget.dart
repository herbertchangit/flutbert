import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MyStack(),
      )
  );
}

class MyStack extends StatefulWidget {
  const MyStack({super.key});

  @override
  State<MyStack> createState() => _MyStack();
}

class _MyStack extends State<MyStack>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
          title: const Text('Stack Sample'),
        ),
        body: Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.antiAlias,
          children: const [
            _SizedBox(),
            _Box(),
          ],
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

class _Box extends StatelessWidget{
  const _Box({super.key});

  @override
  Widget build(BuildContext context){
    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        width: 150,
        height: 150,
        decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(20)),
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
