import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutbert/Setup/signIn.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
//import 'package:flutter/material.dart';

import 'package:flutbert/Pages/route_build.dart';
import 'package:flutbert/Pages/column_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutbert/Pages/download_button.dart';
import 'package:flutbert/Pages/tabular.dart';
import 'package:flutbert/Pages/fade_page.dart';
import 'package:flutbert/Pages/animation_widgets.dart';
import 'package:flutbert/Pages/filter_selection.dart';
import 'package:flutbert/Pages/parallax.dart';
import 'package:flutbert/Pages/shimmer_loading.dart';
import 'package:flutbert/Pages/staggered_menu.dart';
import 'package:flutbert/Pages/typing_indicator.dart';
import 'package:flutbert/Pages/appbar.dart';
import 'package:flutbert/Pages/listView.dart';
import 'package:flutbert/Pages/padding_widget.dart';
import 'package:flutbert/Pages/align_widget.dart';
import 'package:flutbert/Pages/sizedbox_widget.dart';
import 'package:flutbert/Pages/stack_widget.dart';
import 'package:flutbert/Pages/expandable_fab.dart';
import 'package:flutbert/Pages/physics_card.dart';
import 'package:flutbert/Pages/validate_form.dart';
import 'package:flutbert/Pages/TextEditing.dart';
import 'package:flutbert/Pages/focusNode.dart';
import 'package:flutbert/Pages/inkwell.dart';
import 'package:flutbert/Pages/swipe_dismiss.dart';
import 'package:flutbert/Pages/web_image.dart';
import 'package:flutbert/Pages/horizontal_list.dart';
import 'package:flutbert/Pages/grid_list.dart';
import 'package:flutbert/Pages/mixed_list.dart';
import 'package:flutbert/Pages/floating_appbar.dart';
import 'package:flutbert/Pages/across_screen.dart';
import 'package:flutbert/Pages/route_back.dart';
import 'package:flutbert/Pages/route_argument.dart';
import 'package:flutbert/Pages/route_return_data.dart';
import 'package:flutbert/Pages/route_pass_argument.dart';
import 'package:flutbert/Pages/http_delete.dart';
import 'package:flutbert/Pages/networking_fetch_data_call_api.dart';
import 'package:flutbert/Pages/Parse_JSON.dart';
import 'package:flutbert/Pages/http_send_data.dart';
import 'package:flutbert/Pages/http_update_data.dart';
import 'package:flutbert/Pages/webSockets.dart';
import 'package:flutbert/Pages/file_read_write.dart';
import 'package:flutbert/Pages/share_preference.dart';
import 'package:flutbert/Pages/camera_take_photo.dart';

import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

import 'package:flutbert/Setup/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  //final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  //final firstCamera = cameras.first;

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDBPAr3iePYGT0CYm19W-slNSFl5gNgbPg',
      appId: '1:437580923019:android:0a6551c5f0188b9d8b148e',
      messagingSenderId: '437580923019',
      projectId: 'flutbert-42bd7',
    ),
  );

  await SentryFlutter.init(
        (options) {
            options.dsn = 'https://fe3a79b234734d3f884e6fd505267e18@o4503937315897344.ingest.sentry.io/4503937319305216';
            // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
            // We recommend adjusting this value in production.
            options.tracesSampleRate = 1.0;
          },
    //appRunner: () => runApp(MaterialApp(home: MyHomePage(camera: firstCamera,),),),
    appRunner: () => runApp(const MaterialApp(home: MyHomePage(),),),
    //appRunner: () => runApp(const MaterialApp(home: MyValidFormApp(),),),
    //appRunner: () => runApp(const MaterialApp(home: WelcomePage(),),),
  );
  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

//void main() {
//  runApp(
//      const MaterialApp(
//        home: MyApp(),
        //home: MyValidFormApp(),
        //home: MyTextEditingApp(),
        //home: MyFocusNodeApp(),
//      )
//  );
//}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});
  //const MyHomePage({super.key, required this.camera});
  //final CameraDescription camera;
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{
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
              leading: const Icon(Icons.video_call),
              hoverColor: hoverOverColor,
              title: const Text('Take Camera Photo'),
              onTap: () {Navigator.of(context).push(_createRoute2('TakeCameraPhoto'));},
            ),
            ListTile(
              leading: const Icon(Icons.video_call),
              hoverColor: hoverOverColor,
              title: const Text('Play Stop Video'),
              onTap: () {Navigator.of(context).push(_createRoute2('PlayStopVideo'));},
            ),
            ListTile(
              leading: const Icon(Icons.share),
              hoverColor: hoverOverColor,
              title: const Text('Share Preference'),
              onTap: () {Navigator.of(context).push(_createRoute2('SharePreference'));},
            ),
            ListTile(
              leading: const Icon(Icons.file_open),
              hoverColor: hoverOverColor,
              title: const Text('File Read & Write'),
              onTap: () {Navigator.of(context).push(_createRoute2('FileReadWrite'));},
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              hoverColor: hoverOverColor,
              title: const Text('WebSockets'),
              onTap: () {Navigator.of(context).push(_createRoute2('WebSockets'));},
            ),
            ListTile(
              leading: const Icon(Icons.update),
              hoverColor: hoverOverColor,
              title: const Text('HTTP Update Data'),
              onTap: () {Navigator.of(context).push(_createRoute2('HttpUpdateData'));},
            ),
            ListTile(
              leading: const Icon(Icons.send),
              hoverColor: hoverOverColor,
              title: const Text('HTTP Send Data'),
              onTap: () {Navigator.of(context).push(_createRoute2('HttpSendData'));},
            ),
            ListTile(
              leading: const Icon(Icons.paragliding_sharp),
              hoverColor: hoverOverColor,
              title: const Text('Parse JSON'),
              onTap: () {Navigator.of(context).push(_createRoute2('ParseJSON'));},
            ),
            ListTile(
              leading: const Icon(Icons.data_exploration),
              hoverColor: hoverOverColor,
              title: const Text('Fetch Data - call API'),
              onTap: () {Navigator.of(context).push(_createRoute2('fetchData'));},
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              hoverColor: hoverOverColor,
              title: const Text('Http Delete'),
              onTap: () {Navigator.of(context).push(_createRoute2('HttpDelete'));},
            ),
            ListTile(
              leading: const Icon(Icons.route),
              hoverColor: hoverOverColor,
              title: const Text('Route Pass Argument'),
              onTap: () {Navigator.of(context).push(_createRoute2('RoutePassArgu'));},
            ),
            ListTile(
              leading: const Icon(Icons.assignment_return),
              hoverColor: hoverOverColor,
              title: const Text('Route Return Data'),
              onTap: () {Navigator.of(context).push(_createRoute2('RouteReturnData'));},
            ),
            ListTile(
              leading: const Icon(Icons.route),
              hoverColor: hoverOverColor,
              title: const Text('Route Argument'),
              onTap: () {Navigator.of(context).push(_createRoute2('RouteArgument'));},
            ),
            ListTile(
              leading: const Icon(Icons.route),
              hoverColor: hoverOverColor,
              title: const Text('Route Back'),
              onTap: () {Navigator.of(context).push(_createRoute2('RouteBack'));},
            ),
            ListTile(
              leading: const Icon(Icons.route),
              hoverColor: hoverOverColor,
              title: const Text('Across Screen'),
              onTap: () {Navigator.of(context).push(_createRoute2('AcrossScreen'));},
            ),
            ListTile(
              leading: const Icon(Icons.flood_sharp),
              hoverColor: hoverOverColor,
              title: const Text('Floating App Bar'),
              onTap: () {Navigator.of(context).push(_createRoute2('FloatingApp'));},
            ),
            ListTile(
              leading: const Icon(Icons.mic_none),
              hoverColor: hoverOverColor,
              title: const Text('Mixed List'),
              onTap: () {Navigator.of(context).push(_createRoute2('Mixedlist'));},
            ),
            ListTile(
              leading: const Icon(Icons.grid_3x3),
              hoverColor: hoverOverColor,
              title: const Text('Grid List'),
              onTap: () {Navigator.of(context).push(_createRoute2('Grid'));},
            ),
            ListTile(
              leading: const Icon(Icons.horizontal_rule),
              hoverColor: hoverOverColor,
              title: const Text('Horizontal List'),
              onTap: () {Navigator.of(context).push(_createRoute2('Horizontal'));},
            ),
            ListTile(
              leading: const Icon(Icons.image),
              hoverColor: hoverOverColor,
              title: const Text('Web Images'),
              onTap: () {Navigator.of(context).push(_createRoute2('WebImages'));},
            ),
            ListTile(
              leading: const Icon(Icons.swipe),
              hoverColor: hoverOverColor,
              title: const Text('Swipe Dismiss'),
              onTap: () {Navigator.of(context).push(_createRoute2('SwipeDismiss'));},
            ),
            ListTile(
              leading: const Icon(Icons.app_shortcut),
              hoverColor: hoverOverColor,
              title: const Text('AppBar Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute2('AppBar'));},
            ),
            ListTile(
              enabled: true,
              leading: const Icon(Icons.view_column),
              hoverColor: hoverOverColor,
              title: const Text('Column Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute2('Column'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              leading: const Icon(Icons.list),
              title: const Text('ListView Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute2('ListView'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              leading: const Icon(Icons.padding),
              title: const Text('Padding Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute2('Padding'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              leading: const Icon(Icons.align_horizontal_center),
              title: const Text('Align Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute2('Align'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              leading: const Icon(Icons.format_size),
              title: const Text('Sizedbox Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute2('Sizedbox'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              leading: const Icon(Icons.stacked_bar_chart),
              title: const Text('Stack Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute2('Stack'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              leading: const Icon(Icons.animation),
              title: const Text('Animation Widgets'),
              onTap: () {Navigator.of(context).push(_createRoute2('Animated'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              leading: const Icon(Icons.check),
              title: const Text('Fade in and out'),
              onTap: () {Navigator.of(context).push(_createRoute2('Fade'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              leading: const Icon(Icons.tab),
              title: const Text('Tabular'),
              onTap: () {Navigator.of(context).push(_createRoute2('Tabular'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              leading: const Icon(Icons.download),
              title: const Text('Download Button'),
              onTap: () {Navigator.of(context).push(_createRoute2('DownloadButton'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Build Route'),
              onTap: () {Navigator.of(context).push(_createRoute2('BuildRoute'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Filter Selection'),
              onTap: () {Navigator.of(context).push(_createRoute2('FilterSelection'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Parallax'),
              onTap: () {Navigator.of(context).push(_createRoute2('Parallax'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Shimmer'),
              onTap: () {Navigator.of(context).push(_createRoute2('Shimmer'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Staggered Menu'),
              onTap: () {Navigator.of(context).push(_createRoute2('Staggered'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Typing Indicator'),
              onTap: () {Navigator.of(context).push(_createRoute2('Typing'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Expandable FAB'),
              onTap: () {Navigator.of(context).push(_createRoute2('Expandable'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Simulation'),
              onTap: () {Navigator.of(context).push(_createRoute2('Simulation'));},
            ),
            ListTile(
              hoverColor: hoverOverColor,
              title: const Text('Inkwell'),
              onTap: () {Navigator.of(context).push(_createRoute2('Inkwell'));},
            ),
          ],
        ),
      ),
      body: const Center(
        //child: MyParallax(subScreen: false,),
        //child: PhysicsCardDragDemo(),
      ),

    );
  }

  Route _createRoute2(String pageRoute) {
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
    else if(pageRoute=='Inkwell') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MyInkWellApp(title: 'InkWell Demo'),
      );
    }
    else if(pageRoute=='SwipeDismiss') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MySwipeDismissApp(),
      );
    }
    else if(pageRoute=='WebImages') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MyNetworkImageApp(),
      );
    }
    else if(pageRoute=='Horizontal') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MyHorizontalListApp(),
      );
    }
    else if(pageRoute=='Grid') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MyGridListApp(),
      );
    }
    else if(pageRoute=='Mixedlist') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
          MyMixedListApp(
            items: List<ListItem>.generate(1000,
                  (i) => i % 6 == 0
                  ? HeadingItem('Heading $i')
                  : MessageItem('Sender $i', 'Message body $i'),
            ),),
      );
    }
    else if(pageRoute=='FloatingApp') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MyFloatingAppBar(),
      );
    }
    else if(pageRoute=='AcrossScreen') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const AcrossScreen(),
      );
    }
    else if(pageRoute=='RouteBack') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const FirstRoute(),
      );
    }
    else if(pageRoute=='RouteArgument') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MyRouteArgumentApp(),
      );
    }
    else if(pageRoute=='RouteReturnData') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const ReturnDataHomeScreen(),
      );
    }
    else if(pageRoute=='RoutePassArgu') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
          TodosScreen(todos: List.generate(20, (i) =>
              Todo(
                'Todo ${i+1}',
                '${i+1}',
              ),
          ),
          ),
      );
    }
    else if(pageRoute=='HttpDelete') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MyHttpDeleteApp(),
      );
    }
    else if(pageRoute=='fetchData') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MyFetchDataForm(),
      );
    }
    else if(pageRoute=='ParseJSON') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MyParseJSONApp(title: 'Isolate Demo',),
      );
    }
    else if(pageRoute=='HttpSendData') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MySendDataApp(),
      );
    }
    else if(pageRoute=='HttpUpdateData') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MyUpdateDataApp(),
      );
    }
    else if(pageRoute=='WebSockets') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MyWebSocketsApp(title: 'WebSocket Demo'),
      );
    }
    else if(pageRoute=='FileReadWrite') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
          FileReadWriteApp(storage: CounterStorage()),
      );
    }
    else if(pageRoute=='SharePreference') {
      return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
      const MySharePreferencePage(title: 'Share Preference Demo'),
      );
    }
    //else if (pageRoute == 'TakeCameraPhoto') {
      //return PageRouteBuilder(
        //pageBuilder: (context, animation, secondaryAnimation) =>
        //TakePictureScreen(camera: widget.camera,),
      //);
    //}
    else {
      return PageRouteBuilder(pageBuilder: (context, animation,
          secondaryAnimation) => const MyHomePage(),);
    }
  }
}

