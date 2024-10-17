// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:tiledjsonreader/tiledjsonreader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String json = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Text(json),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _loadMap('assets/compressed/map3.tmj');
              },
              child: Text('Normal'),
            ),
            ElevatedButton(
              onPressed: () {
                _loadMap('assets/compressed/map2.tmj');
              },
              child: Text('base64'),
            ),
            ElevatedButton(
              onPressed: () {
                _loadMap('assets/compressed/map.tmj');
              },
              child: Text('zlib'),
            ),
          ],
        ),
      ),
    );
  }

  void _loadMap(String path) {
    TiledJsonReader tiled = TiledJsonReader(path);
    tiled.read().then((value) {
      setState(() {
        json = value.toJson().toString();
      });
    });
  }
}
