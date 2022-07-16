import 'package:tiledjsonreader/map/layer/objects.dart';
import 'package:tiledjsonreader/tile_set/frame_animation.dart';
import 'package:tiledjsonreader/tile_set/tile_set_object_group.dart';

class TileSetItem {
  int? id;
  String? type;
  String? tileClass;
  String? image;
  int? imageHeight;
  int? imageWidth;
  double? probability;
  List<int>? terrain;
  List<FrameAnimation>? animation;
  TileSetObjectGroup? objectGroup;
  List<Property>? properties;

  TileSetItem({this.id, this.objectGroup});

  TileSetItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    tileClass = json['class'];
    image = json['image'];
    imageHeight = json['imageheight'];
    imageWidth = json['imagewidth'];
    probability = json['probability']?.toDouble() ?? 0.0;
    if (json['terrain'] != null) {
      terrain = <int>[];
      json['terrain'].forEach((v) {
        terrain?.add(v);
      });
    }
    objectGroup = json['objectgroup'] != null
        ? new TileSetObjectGroup.fromJson(json['objectgroup'])
        : null;
    if (json['animation'] != null) {
      animation = <FrameAnimation>[];
      json['animation'].forEach((v) {
        animation?.add(new FrameAnimation.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = <Property>[];
      json['properties'].forEach((v) {
        properties?.add(new Property.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['class'] = this.tileClass;
    if (this.objectGroup != null) {
      data['objectgroup'] = this.objectGroup?.toJson();
    }
    return data;
  }
}
