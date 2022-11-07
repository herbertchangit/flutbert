import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MyAppBar(),
      )
  );
}

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBar();
}

class _MyAppBar extends State<MyAppBar>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
          title: const Text('AppBar Sample'),
          automaticallyImplyLeading: true, //return arrow back to previous page
          toolbarOpacity: 0.5, //opacity for bar title
          shadowColor: Colors.blue, // color of shadow
          elevation: 500, //position of shadow
          scrolledUnderElevation: 100.0,
          //surfaceTintColor: Colors.lightGreen,
          backgroundColor: Colors.teal, //background color of bar
          foregroundColor: Colors.lightGreenAccent, //foreground color of bar
          iconTheme: const IconThemeData(color: Colors.black, opacity: 0.4, size: 40), //icon settings
          titleTextStyle: Theme.of(context).primaryTextTheme.headline6,
          toolbarHeight: 101+23, //height of bar
          centerTitle: true, //bar title alignment
          primary: true, //display on top of the app (all widgets)
          //titleSpacing: 50, //distance to right from icon
          bottomOpacity: 0.2,
          //leadingWidth: 0, //distance from left edge
        ),
      body: ListView(
        scrollDirection: Axis.vertical, //text direction vertical or horizontal
          children: [
            ListTile(title: Text('automaticallyImplyLeading: true, (return arrow back to previous page)',
              style: Theme.of(context).textTheme.titleSmall,),),
            ListTile(title: Text('toolbarOpacity: 0.5, (opacity for bar title)',
              style: Theme.of(context).textTheme.titleSmall,),),
            const ListTile(title: Text('shadowColor: Colors.blue, (color of shadow)'),),
            const ListTile(title: Text('elevation: 500, (position of shadow)'),),
            const ListTile(title: Text('backgroundColor: Colors.teal, (background color of bar)'),),
            const ListTile(title: Text('foregroundColor: Colors.lightGreenAccent, ()foreground color of bar)'),),
          ],
        ));
  }
}
