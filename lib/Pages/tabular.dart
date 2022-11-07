import 'package:flutbert/Pages/download_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MyTab(),
      )
  );
}

// ================ Tab
class MyTab extends StatefulWidget{
  const MyTab({super.key});

  @override
  State<MyTab> createState() => _MyTab();
}

class _MyTab extends State<MyTab> {
  late final List<DownloadController> _downloadControllers;

  @override
  void initState() {
    super.initState();
    _downloadControllers = List<DownloadController>.generate
      (30,
          (index) => SimulatedDownloadController
        (
          onOpenDownload: ()
          {
            debugPrint('Stimulating ..... ');
            //debugPrint('0. Open $index');
            _openDownload(index);
            //debugPrint('2. List ${index+1}');
          }
      ),
    );
  }

  void _openDownload(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Open App ${index + 1}'),
      ),
    );
    //debugPrint('1. Open App ${index + 1}');
  }

  @override
  Widget build(BuildContext context){
    return  DefaultTabController(length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tabular bar',
              style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center,),
            bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ]),
          ),
          body: TabBarView(children:
          [
            Container(
              color: Theme.of(context).colorScheme.secondary,
              child: Text('Herbert Chan on app .... ',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center),
            ),
            ListView.separated(
                itemBuilder: _buildListItem,
                separatorBuilder: (_, __) => const Divider(),
                itemCount: 20),
            const Icon(Icons.directions_bike),
          ]),
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    final theme = Theme.of(context);
    final downloadController = _downloadControllers[index];
    //debugPrint('1. Start building list ....');
    return ListTile(
      leading: const DemoAppIcon(),
      title: Text(
        'Alarm ${index + 1}',
        overflow: TextOverflow.fade,
        style: theme.textTheme.headline6,
      ),
      subtitle: Text(
        'Omniu Cook #${index + 1}',
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.caption,
      ),
      trailing: SizedBox(
        width: 80,
        height: 300,
        child: AnimatedBuilder(
          animation: downloadController,
          builder: (context, child) {
            return DownloadButton(
              status: downloadController.downloadStatus,
              downloadProgress: downloadController.progress,
              onDownload: downloadController.startDownload,
              onCancel: downloadController.stopDownload,
              onOpen: downloadController.openDownload,
            );
          },
        ),
      ),
    );
  }
}
