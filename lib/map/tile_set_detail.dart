import 'package:tiledjsonreader/map/layer/objects.dart';
import 'package:tiledjsonreader/tile_set/terrain.dart';
import 'package:tiledjsonreader/tile_set/tile_set.dart';
import 'package:tiledjsonreader/tile_set/wang_set.dart';

class TileSetDetail {
  String? backgroundColor;
  int? columns;
  int? firsTgId;
  String? image;
  int? imageHeight;
  int? imageWidth;
  int? margin;
  String? name;
  String? objectAlignment;
  List<Property>? properties;
  String? source;
  int? spacing;
  List<Terrain>? terrains;
  int? tileCount;
  String? tiledVersion;
  int? tileHeight;
  int? tileWidth;
  String? transparentColor;
  String? type;
  double? version;
  List<WangSet>? wangSets;
  TileSet? tileSet;

  TileSetDetail({this.firsTgId, this.source, this.tileSet});

  TileSetDetail.fromJson(Map<String, dynamic> json) {
    firsTgId = json['firstgid'];
    source = json['source'];
    backgroundColor = json['backgroundcolor'];
    columns = json['columns'];
    image = json['image'];
    imageHeight = json['imageheight'];
    imageWidth = json['imagewidth'];
    margin = json['margin'];
    name = json['name'];
    objectAlignment = json['objectalignment'];
    spacing = json['spacing'];
    tileCount = json['tilecount'];
    tiledVersion = json['tiledversion'];
    tileHeight = json['tileheight'];
    tileWidth = json['tilewidth'];
    transparentColor = json['transparentcolor'];
    version = double.tryParse(json['version'].toString()) ?? 0.0;
    type = json['type'];
    if (json['tileSet'] != null) tileSet = TileSet.fromJson(json['tileSet']);
    if (json['properties'] != null) {
      properties = <Property>[];
      json['properties'].forEach((v) {
        properties?.add(new Property.fromJson(v));
      });
    }
    if (json['terrains'] != null) {
      terrains = [];
      json['terrains'].forEach((v) {
        terrains?.add(v);
      });
    }
    if (json['wangsets'] != null) {
      wangSets = [];
      json['wangsets'].forEach((v) {
        wangSets?.add(WangSet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstgid'] = this.firsTgId;
    data['source'] = this.source;
    if (tileSet != null) data['tileSet'] = tileSet?.toJson();
    return data;
  }
}
