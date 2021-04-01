import 'package:tiledjsonreader/map/layer/objects.dart';
import 'package:tiledjsonreader/tile_set/terrain.dart';
import 'package:tiledjsonreader/tile_set/tile_set.dart';
import 'package:tiledjsonreader/tile_set/wang_set.dart';

class TileSetDetail {
  String? backgroundcolor;
  int? columns;
  int? firsTgId;
  String? image;
  int? imageheight;
  int? imagewidth;
  int? margin;
  String? name;
  String? objectalignment;
  List<Property>? properties;
  String? source;
  int? spacing;
  List<Terrain>? terrains;
  int? tilecount;
  String? tiledversion;
  int? tileheight;
  int? tilewidth;
  String? transparentcolor;
  String? type;
  String? version;
  List<WangSet>? wangsets;
  TileSet? tileSet;

  TileSetDetail({this.firsTgId, this.source, this.tileSet});

  TileSetDetail.fromJson(Map<String, dynamic> json) {
    firsTgId = json['firstgid'];
    source = json['source'];
    backgroundcolor = json['backgroundcolor'];
    columns = json['columns'];
    image = json['image'];
    imageheight = json['imageheight'];
    imagewidth = json['imagewidth'];
    margin = json['margin'];
    name = json['name'];
    objectalignment = json['objectalignment'];
    spacing = json['spacing'];
    tilecount = json['tilecount'];
    tiledversion = json['tiledversion'];
    tileheight = json['tileheight'];
    tilewidth = json['tilewidth'];
    transparentcolor = json['transparentcolor'];
    version = json['version'];
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
      wangsets = [];
      json['wangsets'].forEach((v) {
        wangsets?.add(WangSet.fromJson(v));
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
