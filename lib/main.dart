import 'dart:math';

import 'package:flutbert/buld_route.dart';
import 'package:flutbert/column_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutbert/download_button.dart';
import 'package:flutbert/tabular.dart';
import 'package:flutbert/fade_page.dart';
import 'package:flutbert/animation_widgets.dart';
import 'package:flutbert/filter_selection.dart';
import 'package:flutbert/parallax.dart';
import 'package:flutbert/shimmer_loading.dart';
import 'package:flutbert/staggered_menu.dart';
import 'package:flutbert/typing_indicator.dart';
import 'package:flutbert/appbar.dart';
import 'package:flutbert/listView.dart';
import 'package:flutbert/padding_widget.dart';
import 'package:flutbert/align_widget.dart';
import 'package:flutbert/sizedbox_widget.dart';
import 'package:flutbert/stack_widget.dart';
import 'package:flutbert/expandable_fab.dart';
import 'package:flutbert/physics_card.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp>{
  Color hoverOverColor = Colors.blueAccent;

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(title: const Text('Flut Bird',)),
      drawer: Drawer(
        semanticLabel: 'Functions',
        elevation: 2,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(decoration: BoxDecoration(color: Colors.blue),child: Text('Widget List'),) ,
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('AppBar Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute('AppBar'));},
            ),
            ListTile(
              enabled: false,
              hoverColor: hoverOverColor,
              title: const Text('Column Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute('Column'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('ListView Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute('ListView'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Padding Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute('Padding'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Align Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute('Align'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Sizedbox Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute('Sizedbox'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Stack Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute('Stack'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Animation Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute('Animated'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Fade in and out'),
              onTap: () {Navigator.of(context).push(_createRoute('Fade'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Tabular'),
              onTap: () {Navigator.of(context).push(_createRoute('Tabular'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Download Button'),
              onTap: () {Navigator.of(context).push(_createRoute('DownloadButton'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Build Route'),
              onTap: () {Navigator.of(context).push(_createRoute('BuildRoute'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Filter Selection'),
              onTap: () {Navigator.of(context).push(_createRoute('FilterSelection'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Parallax'),
              onTap: () {Navigator.of(context).push(_createRoute('Parallax'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Shimmer'),
              onTap: () {Navigator.of(context).push(_createRoute('Shimmer'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Staggered Menu'),
              onTap: () {Navigator.of(context).push(_createRoute('Staggered'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Typing Indicator'),
              onTap: () {Navigator.of(context).push(_createRoute('Typing'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Expandable FAB'),
              onTap: () {Navigator.of(context).push(_createRoute('Expandable'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Simulation'),
              onTap: () {Navigator.of(context).push(_createRoute('Simulation'));},
            ),
          ],
        ),
      ),
      body: const Center(
        child: MyParallax(subScreen: false,),
      ),

    );
  }
}

Route _createRoute(String pageRoute){
  if(pageRoute=='Fade'){
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
      const MyFadePage(title: 'Fade in and out',),
    );
  }
  else if(pageRoute=='Animated') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const AnimatedContainerApp(),
    );
  }
  else if(pageRoute=='Tabular') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const MyTab(),
    );
  }
  else if(pageRoute=='DownloadButton') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const ExampleCupertinoDownloadButton(),
    );
  }
  else if(pageRoute=='BuildRoute') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const HomeScreen(),
    );
  }
  else if(pageRoute=='FilterSelection') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const ExampleInstagramFilterSelection(),
    );
  }
  else if(pageRoute=='Parallax') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const MyParallax(subScreen: true),
    );
  }
  else if(pageRoute=='Shimmer') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const MyShimmer(),
    );
  }
  else if(pageRoute=='Staggered') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const ExampleStaggeredAnimations(),
    );
  }
  else if(pageRoute=='Typing') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const ExampleIsTyping(),
    );
  }
  else if(pageRoute=='AppBar') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const MyAppBar(),
    );
  }
  else if(pageRoute=='Column') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const MyColumn(),
    );
  }
  else if(pageRoute=='ListView') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const MyListView(),
    );
  }
  else if(pageRoute=='Padding') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const MyPadding(),
    );
  }
  else if(pageRoute=='Align') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const MyAlign(),
    );
  }
  else if(pageRoute=='Sizedbox') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const MySizedBox(),
    );
  }
  else if(pageRoute=='Stack') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const MyStack(),
    );
  }
  else if(pageRoute=='Expandable') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const MyExpandableFab(),
    );
  }
  else if(pageRoute=='Simulation') {
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
    const PhysicsCardDragDemo(),
    );
  }
  else {
    return PageRouteBuilder(pageBuilder: (context,animation, secondaryAnimation )=> const MyApp(),);
  }
}


