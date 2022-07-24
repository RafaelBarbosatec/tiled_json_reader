import 'package:tiledjsonreader/map/layer/objects.dart';
import 'package:tiledjsonreader/tile_set/terrain.dart';
import 'package:tiledjsonreader/tile_set/tile_set_item.dart';
import 'package:tiledjsonreader/tile_set/wang_set.dart';

class TileSetDetail {
  String? backgroundColor;
  int? columns;
  int? firsTgId;
  String? image;
  double? imageHeight;
  double? imageWidth;
  double? margin;
  String? name;
  String? objectAlignment;
  List<Property>? properties;
  String? source;
  double? spacing;
  List<Terrain>? terrains;
  int? tileCount;
  String? tiledVersion;
  double? tileHeight;
  double? tileWidth;
  String? transparentColor;
  String? type;
  double? version;
  List<WangSet>? wangSets;
  List<TileSetItem>? tiles;

  TileSetDetail({this.firsTgId, this.source});

  TileSetDetail.fromJson(Map<String, dynamic> json) {
    firsTgId = json['firstgid'];
    source = json['source'];
    backgroundColor = json['backgroundcolor'];
    columns = json['columns'];
    image = json['image'];
    imageHeight = double.tryParse(json['imageheight'].toString()) ?? 0.0;
    imageWidth = double.tryParse(json['imagewidth'].toString()) ?? 0.0;
    margin = double.tryParse(json['margin'].toString()) ?? 0.0;
    name = json['name'];
    objectAlignment = json['objectalignment'];
    spacing = double.tryParse(json['spacing'].toString()) ?? 0.0;
    tileCount = json['tilecount'];
    tiledVersion = json['tiledversion'];
    tileHeight = double.tryParse(json['tileheight'].toString()) ?? 0.0;
    tileWidth = double.tryParse(json['tileWidth'].toString()) ?? 0.0;
    transparentColor = json['transparentcolor'];
    version = double.tryParse(json['version'].toString()) ?? 0.0;
    type = json['type'];
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
    if (json['tiles'] != null) {
      tiles = <TileSetItem>[];
      json['tiles'].forEach((v) {
        tiles?.add(new TileSetItem.fromJson(v));
      });
    }
  }

  void updateFromMap(Map<String, dynamic> json) {
    backgroundColor = json['backgroundcolor'];
    columns = json['columns'];
    image = json['image'];
    imageHeight = double.tryParse(json['imageheight'].toString()) ?? 0.0;
    imageWidth = double.tryParse(json['imagewidth'].toString()) ?? 0.0;
    margin = double.tryParse(json['margin'].toString()) ?? 0.0;
    name = json['name'];
    objectAlignment = json['objectalignment'];
    spacing = double.tryParse(json['spacing'].toString()) ?? 0.0;
    tileCount = json['tilecount'];
    tiledVersion = json['tiledversion'];
    tileHeight = double.tryParse(json['tileheight'].toString()) ?? 0.0;
    tileWidth = double.tryParse(json['tilewidth'].toString()) ?? 0.0;
    transparentColor = json['transparentcolor'];
    version = double.tryParse(json['version'].toString()) ?? 0.0;
    type = json['type'];
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
    if (json['tiles'] != null) {
      tiles = <TileSetItem>[];
      json['tiles'].forEach((v) {
        tiles?.add(new TileSetItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstgid'] = this.firsTgId;
    data['source'] = this.source;
    data['image'] = this.image;
    data['tiles'] = this.tiles?.map((e) => e.toJson());
    return data;
  }
}
