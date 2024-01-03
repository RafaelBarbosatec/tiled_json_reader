library tiledjsonreader;

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tiledjsonreader/map/tiled_map.dart';

import 'map/tile_set_detail.dart';

export 'map/layer/tile_layer.dart';

class TiledJsonReader {
  final String pathFile;
  String? _basePathFile;
  String? _fileName;
  TiledMap? _map;

  TiledJsonReader(this.pathFile) {
    _fileName = pathFile.split('/').last;
    if (!(_fileName?.contains('.json') == true ||
        _fileName?.contains('.tmj') == true)) {
      throw Exception('only supports json files');
    }
    _basePathFile = pathFile.replaceAll(_fileName ?? '', '');
  }

  Future<TiledMap> read() async {
    String data = await rootBundle.loadString(pathFile);
    Map<String, dynamic> _result = jsonDecode(data);
    _map = TiledMap.fromJson(_result);
    if (_map?.tileSets != null) {
      await Future.forEach(_map!.tileSets!, (TileSetDetail tileSet) async {
        if (tileSet.source != null) {
          if (!(tileSet.source!.contains('.json') ||
              tileSet.source!.contains('.tsj'))) {
            throw Exception('Invalid TileSet source: only supports json files');
          }
          String data = await rootBundle.loadString(
            '$_basePathFile${tileSet.source}',
          );
          tileSet.updateFromMap(jsonDecode(data));
        }
      });
    }

    return Future.value(_map);
  }
}
