import '../map/layer/map_layer.dart';
import '../map/layer/object_group.dart';
import '../map/layer/tile_layer.dart';
import '../map/layer/type_layer.dart';
import '../map/tile_set_detail.dart';
import '../util/extensions.dart';
import 'layer/group_layer.dart';
import 'layer/image_layer.dart';

class TiledMap {
  String? backgroundColor;
  int? compressionLevel;
  int? height;
  int? hexSideLength;
  bool? infinite;
  List<MapLayer>? layers;
  int? nextLayerId;
  int? nextObjectId;
  String? orientation;
  String? renderOrder;
  String? staggerAxis;
  String? staggerIndex;
  String? tiledVersion;
  int? tileHeight;
  List<TileSetDetail>? tileSets;
  int? tileWidth;
  String? type;
  double? version;
  int? width;

  TiledMap({
    this.compressionLevel,
    this.height,
    this.infinite,
    this.layers,
    this.nextLayerId,
    this.nextObjectId,
    this.orientation,
    this.renderOrder,
    this.tiledVersion,
    this.tileHeight,
    this.tileSets,
    this.tileWidth,
    this.type,
    this.version,
    this.width,
  });

  TiledMap.fromJson(Map<String, dynamic> json) {
    compressionLevel = json['compressionlevel'];
    height = json['height'];
    infinite = json['infinite'];
    if (json['layers'] != null) {
      layers = <MapLayer>[];
      json['layers'].forEach((v) {
        if (v['type'] == TypeLayer.tilelayer.getName()) {
          layers?.add(TileLayer.fromJson(v));
        } else if (v['type'] == TypeLayer.objectgroup.getName()) {
          layers?.add(ObjectGroup.fromJson(v));
        } else if (v['type'] == TypeLayer.imagelayer.getName()) {
          layers?.add(ImageLayer.fromJson(v));
        } else if (v['type'] == TypeLayer.group.getName()) {
          layers?.add(GroupLayer.fromJson(v));
        } else {
          layers?.add(MapLayer.fromJson(v));
        }
      });
    }
    nextLayerId = json['nextlayerid'];
    nextObjectId = json['nextobjectid'];
    orientation = json['orientation'];
    renderOrder = json['renderorder'];
    tiledVersion = json['tiledversion'];
    tileHeight = json['tileheight'];
    if (json['tilesets'] != null) {
      tileSets = <TileSetDetail>[];
      json['tilesets'].forEach((v) {
        tileSets?.add(new TileSetDetail.fromJson(v));
      });
    }
    tileWidth = json['tilewidth'];
    type = json['type'];
    version = double.tryParse(json['version'].toString()) ?? 0.0;
    width = json['width'];
    backgroundColor = json['backgroundcolor'];
    hexSideLength = json['hexsidelength'];
    staggerAxis = json['staggeraxis'];
    staggerIndex = json['staggerindex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compressionlevel'] = this.compressionLevel;
    data['height'] = this.height;
    data['infinite'] = this.infinite;
    if (this.layers != null) {
      data['layers'] = this.layers?.map((v) => v.toJson()).toList();
    }
    data['nextlayerid'] = this.nextLayerId;
    data['nextobjectid'] = this.nextObjectId;
    data['orientation'] = this.orientation;
    data['renderorder'] = this.renderOrder;
    data['tiledversion'] = this.tiledVersion;
    data['tileheight'] = this.tileHeight;
    if (this.tileSets != null) {
      data['tilesets'] = this.tileSets?.map((v) => v.toJson()).toList();
    }
    data['tilewidth'] = this.tileWidth;
    data['type'] = this.type;
    data['version'] = this.version;
    data['width'] = this.width;
    return data;
  }
}
