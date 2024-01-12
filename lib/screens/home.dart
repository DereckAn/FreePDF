import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DropzoneViewController controller;
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropzone example'),
      ),
      body: Stack(
        children: [
          DropzoneView(
            operation: DragOperation.copy,
            cursor: CursorType.grab,
            onCreated: (ctrl) => controller = ctrl,
            onLoaded: () => print('Zone loaded'),
            onError: (ev) => print('Error: $ev'),
            onHover: () => print('Hover'),
            onDrop: (ev) async {
              print('Drop: ${ev.name}');
              final data = await controller.getFileData(ev);
              setState(() {
                message = 'Dropped ${ev.name} with size ${data?.length}';
              });
            },
          ),
          Positioned(
            bottom: 0,
            child: Text(message),
          ),
        ],
      ),
    );
  }
}
