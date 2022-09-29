import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MyFadePage(title: 'Opacity Demo',),
      )
  );
}

class MyFadePage extends StatefulWidget{
  final String title;
  const MyFadePage({
    super.key, required this.title,
  });

  @override
  State<MyFadePage> createState() => _MyOrientationFadePageState();
}

class _MyOrientationFadePageState extends State<MyFadePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: OrientationBuilder(
        builder: (context, orientation){
          return Center(
            child: AnimatedOpacity(
              opacity: _visible? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(width: 200.0, height: 200.0, color: Colors.deepPurpleAccent),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {_visible = !_visible;});
          checkVisibilityStatus(_visible, context);
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flag_circle),
      ),
    );
  }
}

class _MyFadePageState extends State<MyFadePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(width: 200.0, height: 200.0, color: Colors.deepPurpleAccent),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1 Visible'),
              onTap: () {
                Navigator.pop(context);
                setState(() {_visible = true;});
                checkVisibilityStatus(_visible, context);
              },
            ),
            ListTile(
              title: const Text('Item 2 Invisible'),
              onTap: () {
                setState(() {_visible = false;});
                checkVisibilityStatus(_visible, context);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {_visible = !_visible;});
          checkVisibilityStatus(_visible, context);
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),
      ),
    );
  }
}

void checkVisibilityStatus(bool visible, BuildContext context){
  if(!visible){
    final snackBar = SnackBar(
      content: const Text('Box disappear'),
      action: SnackBarAction(label: 'Ok', onPressed: (){},),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }else{
    final snackBar = SnackBar(
      content: const Text('Box appear'),
      action: SnackBarAction(label: 'Ok', onPressed: (){},),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}