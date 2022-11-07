import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MyNetworkImageApp(),
      )
  );
}

class MyNetworkImageApp extends StatefulWidget {
  const MyNetworkImageApp({super.key});

  @override
  State<MyNetworkImageApp> createState() => _MyNetworkImageApp();
}

class _MyNetworkImageApp extends State<MyNetworkImageApp> {

  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leadingWidth: 100,
          //leading: const Icon(Icons.arrow_left),
          automaticallyImplyLeading: true,
        ),
        body: Stack(
          children: [
            Center(
              child: FadeInImage.assetNetwork(placeholder: 'assets/loading.gif', image: 'https://picsum.photos/250?image=9')
              ),
            ],
        )
    );
  }
}